#!/usr/bin/env python3

from os import environ, path
from flask import Flask, render_template, request, redirect, url_for
from werkzeug.utils import secure_filename

app = Flask(__name__)

app.config['MAX_CONTENT_LENGTH'] = 1 * 1024 * 1024
app.config['UPLOAD_EXTENSIONS'] = ['.txt']
app.config["PORT"] = environ.get('PORT')

@app.route("/")
def index():
    return render_template('index.html')

@app.route("/", methods=['POST'])
def upload_file():
    uploaded_file = request.files['file']
    filename = secure_filename(uploaded_file.filename)
    if filename != '':
        file_ext = path.splitext(filename)[1]
        if file_ext not in app.config['UPLOAD_EXTENSIONS']:
            abort(400)
        return 'File uploaded, but not yet evaluated.'
    return redirect(url_for('index'))

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=app.config['PORT'])
