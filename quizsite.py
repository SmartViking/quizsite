# -*- coding: utf-8 -*-

from flask import Flask, jsonify, render_template, request, g, url_for, abort
import sqlite3

app = Flask(__name__)

DATABASE = 'questions.db'

app.config['DEBUG'] = True


def connect_db():
    return sqlite3.connect(DATABASE)

def query_db(query, args=(), one=False):
    cur = g.db.execute(query, args)
    rv = [dict((cur.description[idx][0], value)
               for idx, value in enumerate(row)) for row in cur.fetchall()]
    return (rv[0] if rv else None) if one else rv

@app.before_request
def before_request():
    g.db = connect_db()

@app.teardown_request
def teardown_request(exception):
    if hasattr(g, 'db'):
        g.db.close()


@app.route('/fetch_question.json')
def fetch_question():
    """ Fetch a random question from the database and return as json """

    question = query_db("select * from alt_question order by RANDOM() limit 1",one="true")

    return jsonify(
        qid=question['id'],
        question=question['question'],
        answer=question['answer'],
        alt_1=str(question['alt_1']),
        alt_2=str(question['alt_2']),
        alt_3=str(question['alt_3'])
        )

@app.route('/check_answer/<int:question_id>/<int:alternative>')
def check_answer(question_id, alternative):

    answer = query_db("select answer from alt_question where id = ?",
                      [question_id], one="true")

    if not answer:
        abort(404)
    elif answer['answer'] == alternative:
        return "true"
    else:
        return str(answer['answer'])

@app.route('/')
def quizpage():
    return render_template('quizpage.html')


if __name__ == '__main__':
    app.run()
