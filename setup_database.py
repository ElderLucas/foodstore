#!/usr/bin/env python
# -*- coding: utf-8 -*-

from sqlalchemy import Column, ForeignKey, Integer, String, Unicode
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import relationship
from sqlalchemy import create_engine

import sqlalchemy
 
Base = declarative_base()

#Essa notacao segue o padrao : http://docs.sqlalchemy.org/en/latest/core/engines.html#database-urls
DBpath = "mysql://mariainesartes:artesanato03031963@localhost/mariainesartes_utf8"

#Criando um engine para o nosso database MySQL
engine = sqlalchemy.create_engine('mysql://mariainesartes:artesanato03031963@localhost')

#engine.execute("CREATE DATABASE restaurant_utf8 CHARACTER SET utf8 COLLATE utf8_general_ci")

class User(Base):
    __tablename__ = 'user' 

    id = Column(Integer, primary_key=True)
    name = Column(Unicode(250, collation='utf8_bin'), nullable=False)
    email = Column(Unicode(250, collation='utf8_bin'), nullable=False)
    picture = Column(Unicode(250, collation='utf8_bin'))


class Video_youtube(Base):
    __tablename__ = 'video_youtube'

    id = Column(Integer, primary_key=True)
    video_title = Column(Unicode(250, collation='utf8_bin'), nullable=False)
    video_url = Column(Unicode(250, collation='utf8_bin'), nullable=False)
    user_id = Column(Integer,ForeignKey('user.id'))
    user = relationship(User)

    @property
    def serialize(self):
      """Return object data in easily serializable fomrat """
      return{
        'video_title' : self.video_title,
        'video_url'   : self.video_url,
        'id'          : self.id,
      }

#Tabela criada para armazenar informações e dados sobre os vídeos
class Video_metadata(Base):
    __tablename__ = 'video_metadata'

    id = Column(Integer, primary_key=True)
    video_description = Column(Unicode(250, collation='utf8_bin'), nullable=False)
    video_create_date = Column(Unicode(250, collation='utf8_bin'), nullable=False)
    video_id = Column(Integer,ForeignKey('video_youtube.id'))
    video = relationship(Video_youtube)

    @property
    def serialize(self):
      """Return object data in easily serializable format """
      return{
        'video_description' : self.video_description,
        'video_create_date' : self.video_create_date,
        'id'                : self.id,
      }

#Classe para criar uma tabela com fotos de trabalhos entre outras
class Photo(Base):
    __tablename__ = 'photo'

    id = Column(Integer, primary_key=True)
    photo_title = Column(Unicode(250, collation='utf8_bin'), nullable=False)
    photo_url = Column(Unicode(250, collation='utf8_bin'), nullable=False)
    user_id = Column(Integer,ForeignKey('user.id'))
    user = relationship(User)

    @property
    def serialize(self):
      """Return object data in easily serializable fomrat """
      return{
        'photo_title' : self.photo_title,
        'photo_url'   : self.photo_url,
        'id'          : self.id,
      }

####### Nao esquecer de mudar a senha do data base aqui.
engine = create_engine(DBpath)

Base.metadata.create_all(engine)