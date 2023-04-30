from pydantic import BaseModel

class UserBase(BaseModel):
    username: str
    password: str
    email: str
    phone: str
    name : str
    gender: str = None
    address: str = None


class UserCreate(UserBase):
    password: str


class User(UserBase):
    id: int

    class Config:
        orm_mode = True
