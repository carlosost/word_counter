#!/usr/bin/env python3.6

from os import environ
from flask import Flask

app = Flask(__name__)

app.config["PORT"] = environ.get('PORT')

@app.route("/")
def index():
    return f"Hello, world at port {app.config["PORT"]}"

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=app.config["PORT"])
