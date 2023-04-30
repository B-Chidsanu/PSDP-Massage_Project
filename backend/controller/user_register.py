from Database.database import Base
from sqlalchemy.orm import Session
from .schemas import schema
from models import model



def get_user(db: Session, user_id: int):
    return db.query(model.UserModel).filter(model.UserModel.id == user_id).first()


def get_user_by_email(db: Session, email: str):
    return db.query(model.UserModel).filter(model.UserModel.email == email).first()


def get_user_by_username(db: Session, username: str):
    return db.query(model.UserModel).filter(model.UserModel.username == username).first()


def get_users(db: Session, skip: int = 0, limit: int = 100):
    return db.query(model.UserModel).offset(skip).limit(limit).all()


def create_user(db: Session, user: schema.UserCreate):

    db_user = model.UserModel(
        username=user.username,
        password=user.password,
        name=user.name,
        email=user.email,
        phone=user.phone,
        gender=user.gender,
        address=user.address
    )
    db.add(db_user)
    db.commit()
    db.refresh(db_user)
    return db_user
