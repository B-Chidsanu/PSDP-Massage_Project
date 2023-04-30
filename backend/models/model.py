from sqlalchemy import Column, ForeignKey, Integer, String
from sqlalchemy.orm import relationship
from Database import database

class UserModel(database.Base):
    __tablename__ = "users"

    id = Column(Integer, primary_key=True, index=True)
    username = Column(String, unique=True, index=True)
    password = Column(String)
    name = Column(String(100), unique=True)
    email = Column(String, unique=True)
    phone = Column(String, unique=True)
    gender = Column(String(10))
    address = Column(String(100))

class MassuesModel(database.Base):
    __tablename__ = "massues"

    id = Column(Integer, primary_key=True, index=True)
    username = Column(String, unique=True, index=True)
    password = Column(String)
    name = Column(String(100), unique=True)
    email = Column(String, unique=True)
    phone = Column(String, unique=True)
    gender = Column(String(10))
    address = Column(String(100))    
    imagename = Column()
    certicicart = Column()
