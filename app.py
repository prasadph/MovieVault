import pymysql
from flask import Flask, g, session, redirect, url_for, flash
from functools import wraps

app = Flask(__name__)

# Load default config and override config from an environment variable
app.config.update(dict(
    # DATABASE=os.path.join(app.root_path, 'flaskr.db'),
    SECRET_KEY='development key',
    # USERNAME='admin',
    # PASSWORD='default',
    DEBUG=True,
))



def connect_db():
    db = pymysql.connect("localhost", "root", "root", "movievault" )
    db.cursorclass = pymysql.cursors.DictCursor
    # cursor = db.cursor(pymysql.cursors.DictCursor)
    db.autocommit(True)
    return db


def get_db():
    if not hasattr('g', 'mysql_db'):
        g.mysql_db = connect_db()
    return g.mysql_db




@app.teardown_appcontext
def close_db(error):
    """Closes the database again at the end of the request."""
    if hasattr(g, 'mysql_db'):
        g.mysql_db.close()


from views.movie import *

if __name__ == '__main__':
    app.config['DEBUG'] = True
    app.run()
