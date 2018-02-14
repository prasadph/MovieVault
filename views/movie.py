from flask import request, session, g, redirect, url_for, abort, \
     render_template, flash
from app import app, get_db
from datetime import datetime

base_sql = """SELECT `movies`.`id`, movies.`name`, synopsis,
    description, duration, likes, views,
    countries.`name` country,
    languages.`name` language,
    directors.`name` director,
    `g`.`genres`
    from movies 
    join directors on `director_id`=`directors`.`id` 
    join languages on `languages`.`id`=language_id 
    join countries on `countries`.`id`=country_id
    join (
    select `movies`.`id`, group_concat(`genres`.`name` SEPARATOR ', ') genres 
      from movies 
      join movies_genres mg on `movies`.`id`=`mg`.`movie_id` 
      join genres on `mg`.`genre_id`= `genres`.`id`
      group by `movies`.`id`
    ) g
    on g.`id`= `movies`.`id`
    """

def get_genres():
    sql = "SELECT id, name from genres"
    cursor = get_db().cursor()
    cursor.execute(sql)
    return cursor.fetchall()


def get_countries():
    sql = "SELECT id, name from countries"
    cursor = get_db().cursor()
    cursor.execute(sql)
    return cursor.fetchall()


def get_languages():
    sql = "SELECT id, name from languages"
    cursor = get_db().cursor()
    cursor.execute(sql)
    return cursor.fetchall()

@app.route('/movies/show', methods=['GET'])
def movies_view():
    global base_sql
    sql = base_sql
    sql += "where movies.id=%s limit 1"
    print(sql)
    db = get_db()
    cursor = db.cursor()
    cursor.execute(sql,request.args.get('movie'))
    movie = cursor.fetchone()
    genres = movie['genres'].split(" , ")
    return render_template('movie_detail.html', movie=movie, genres=genres)

    
@app.route('/movies', methods=['GET'])
def movies_list():
    page = 0
    count = 2
    form={}
    global base_sql
    sql = base_sql
    sql += " where 1 "

    country = request.args.get('country')
    if country:
        sql += "and movies.country_id=%s " % country

    lang = request.args.get('language')
    print("lang", lang)
    if lang: 
        sql += "and movies.language_id=%s " % lang

    search = request.args.get('search')
    if search:
        sql += """and movies.name like "%{}%" """.format(search)
    else:
        search = ""

    sort = request.args.get('sort')
    if sort:
        sortl = ["likes", "views", "duration", "name"]
        sql += " order by  movies.%s" % sortl[int(sort)-1]

    
    if request.args.get('page'):
        page = int(request.args.get('page')) - 1
    sql += " limit %s offset %s" % (count, page* count)
    
    print(sql)
    db = get_db()
    cursor = db.cursor()
   
    # movies=None
    # print(sql.__repr__())
    cursor.execute(sql)
    movies = cursor.fetchall()
   

    # genres = get_genres()
    countries = get_countries()
    languages = get_languages()
    return render_template(
        'movies_list.html',
        movies=movies,
        languages=languages,
        countries=countries,
        page=page+1,
        county=country,
        search=search,
        lang=lang,
        sort=sort,
        count=len(movies))


@app.template_filter('time')
def humanize_time_duration(time):
    if time < 60:
        return "%d minutes(s)" % time
    minutes = time % 60
    return "%d hour(s) %d minute(s)" % (time//60, time % 60) 

def url_pagination(page):
    # print(page)
    args = request.args.copy()
    args['page'] = page
    return url_for(request.endpoint, **args)

app.jinja_env.globals['url_pagination'] = url_pagination