#!/usr/bin/env python3.6

from os import environ
from flask import Flask

app = Flask(__name__)

app.config["PORT"] = environ.get('PORT')

@app.route("/")
def index():
    port = app.config['PORT']
    return f"Hello, world at port {port}"

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=app.config['PORT'])
