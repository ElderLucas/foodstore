from sqlalchemy import Column, ForeignKey, Integer, String, Unicode
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import relationship
from sqlalchemy import create_engine

import sqlalchemy
 
Base = declarative_base()

#Essa notacao segue o padrao : http://docs.sqlalchemy.org/en/latest/core/engines.html#database-urls
#DBpath = "mysql://root:oigalera845813@localhost/restaurant_utf8"

#//////////  Vagrant //////////
#engine = sqlalchemy.create_engine('mysql://root:oigalera845813@127.0.0.1:3306')

#/////// Digital Ocean ////////
engine = sqlalchemy.create_engine('mysql://root:procurandonemo@localhost')

engine.execute("CREATE DATABASE mariainesartes_utf8 CHARACTER SET utf8 COLLATE utf8_general_ci")

engine.execute("CREATE USER mariainesartes@localhost IDENTIFIED BY 'artesanato03031963'")

engine.execute("GRANT ALL PRIVILEGES ON mariainesartes_utf8.* TO mariainesartes@localhost")
