from flask import Flask
from marshmallow import Schema, fields, pre_load, validate
from flask_marshmallow import Marshmallow
from flask_sqlalchemy import SQLAlchemy


ma = Marshmallow()
db = SQLAlchemy()

class User(db.Model):
    __tablename__ = 'users'

    id = db.Column(db.Integer(), primary_key=True)
    username = db.Column(db.String(), unique=True)
    firstname = db.Column(db.String())
    lastname = db.Column(db.String())
    password = db.Column(db.String())
    emailaddress = db.Column(db.String())

    def __init__(self, username, firstname, lastname, password, emailaddress):
        self.username = username
        self.firstname = firstname
        self.lastname = lastname
        self.password = password 
        self.emailaddress = emailaddress
    
    def __repr__(self):
        return '<id {}>'.format(self.id)
    
    def serialize(self):
        return {
            'id' : self.id,
            'username': self.username,
            'firstname': self.firstname,
            'lastname': self.lastname,
            'password': self.password,
            'emailaddress': self.emailaddress
        }
