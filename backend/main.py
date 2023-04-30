from typing import List
from fastapi.middleware.cors import CORSMiddleware
from fastapi.security import OAuth2PasswordBearer, OAuth2PasswordRequestForm
from fastapi import FastAPI, Depends, HTTPException
from fastapi.middleware.cors import CORSMiddleware
from controller.schemas import schema as schema
from models import model
from controller import user_register
from Database import database
from sqlalchemy.orm import Session

#INIT DB
model.database.Base.metadata.create_all(bind=database.engine)

#INIT APP
app = FastAPI()


#JWT INIT
oauth2_scheme = OAuth2PasswordBearer(tokenUrl="token")
ACCESS_TOKEN_EXPIRE_MINUTES = 30

origins = [
    "http://localhost",
    "http://localhost:8000",
    "http://localhost:5500",
    "http://127.0.0.1:5500/",
    "http://127.0.0.1:5500"
]

app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Dependency
def get_db():
    db = database.SessionLocal()
    try:
        yield db
    finally:
        db.close()

#endpoint
@app.get('/')
def index():
    return {"HELLO":"WORLD"}


@app.get('/users/', response_model=List[schema.User])
async def get_user(skip: int = 0, limit: int=100, db:Session = Depends(get_db)):
    return user_register.get_users(db=db, skip=skip, limit=limit)
    
@app.post("/users/", response_model=schema.User)
async def create_user(user: schema.UserCreate, db: Session = Depends(get_db)):
    db_user = user_register.get_user_by_username(db, username=user.username)
    if db_user:
        raise HTTPException(status_code=400, detail="Username already registered")
    return user_register.create_user(db=db, user=user)