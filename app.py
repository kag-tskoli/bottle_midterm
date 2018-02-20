from bottle import run, route, error, static_file, template
import requests
import os

response = requests.get('http://apis.is/petrol')

data = response.json()

@route('/')
def index():
    return template('index', data=data)

@route('/company/<c>')
def company(c):
    return template('company', c=c, data=data)

@route('/details/<key>')
def details(key):
    return template('details', key=key, data=data)

@route('/static/<filename>')
def server_static(filename):
    return static_file(filename, root='./')

run()