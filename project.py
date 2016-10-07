#!/usr/bin/env python
# -*- coding: utf-8 -*-

#Flask e SQLAlchemy
from flask import Flask, render_template, request, redirect, jsonify, url_for, flash
from sqlalchemy import create_engine, asc
from sqlalchemy.orm import sessionmaker
from flask import session as login_session

#Importando as classes criadas no setup do banco de dados.
from setup_database import Base, User, Video_youtube, Video_metadata, Photo

#Demais imports
import random
import string
from oauth2client.client import flow_from_clientsecrets
from oauth2client.client import FlowExchangeError
import httplib2
import json
import os
from flask import make_response
import requests

import sys
reload(sys)
sys.setdefaultencoding("utf-8")

app = Flask(__name__)

app_path = os.getcwd()
os.chdir(app_path)

# Variavel "GLOBAL" para nos auxiliar com o PRINT DEINFORMAÇÕES RELEVANTES
DEBUG_ALL = True		#Exibe todas as mensagens Globais caso esteja habilitado
DEBUG_ADD = True		#Exibe todas as mensagens das partes de cadastro de novos Videos
DEBUB_USER = True		#Exibe todas as mensagens do usuários logado

############### LOGIN ################

#Path do Database: user:password@localhost/dabase_name
DBpath = "mysql://mariainesartes:artesanato03031963@localhost/mariainesartes_utf8" #TODO: AUTOMATIZAR ESSA LINHA

engine = create_engine(DBpath) # an Engine, which the Session will use for connection resources

Base.metadata.bind = engine
DBSession = sessionmaker(bind=engine) # create a configured "Session" class
session = DBSession() # create a Session


# URL base. O principal conteúdo do site são os vídeos do Maria Ines Artes.
@app.route('/')
@app.route('/videos/')
def showVideos():
	print "### SHOW ALL VIDEOS"
	return render_template('main.html')

# URL TODO. Aqui será implementada a parte de Compras do Site.
@app.route('/shopping')
def shopping():
	return "EM BREVE UMA LOJA VIRTUAL COM PRODUTOS E ARTESANATOS"

@app.route('/about')
def about():
	return "EM BREVE MAIS INFORMAÇÕES SOBRE O CANAL"

# SISTEMA DE LOGIN
@app.route('/login')
def login():
	return "EM BREVE VOCE PODERA SE LOGAR PARA ACESSAR MAIS CONTEUDOS"

# 0001 Cadastro de novos Videos
@app.route('/video/new/', methods=['GET', 'POST'])
def newVideos():
	return "EM BREVE VOCE PODERA SE LOGAR PARA ACESSAR MAIS CONTEUDOS"






if __name__ == '__main__':
	app.secret_key = 'super_secret_key'
	#app.debug = True
	app.run(host='localhost', port=4567)