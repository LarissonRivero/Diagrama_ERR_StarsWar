from sqlalchemy import create_engine, Column, Integer, String, ForeignKey, DateTime, Enum
from sqlalchemy.orm import declarative_base, relationship
from datetime import datetime

Base = declarative_base()

class Usuario(Base):
    __tablename__ = 'usuarios'

    id = Column(Integer, primary_key=True)
    email = Column(String, unique=True, nullable=False)
    password = Column(String, nullable=False)
    fecha_subscripcion = Column(DateTime, default=datetime.utcnow)
    nombre = Column(String)
    apellido = Column(String)

    favoritos = relationship('Favorito', back_populates='usuario')

class Favorito(Base):
    __tablename__ = 'favoritos'

    id = Column(Integer, primary_key=True)
    tipo = Column(Enum('planeta', 'personaje'), nullable=False)
    favorito_id = Column(Integer, nullable=False)

    usuario_id = Column(Integer, ForeignKey('usuarios.id'))
    usuario = relationship('Usuario', back_populates='favoritos')

class Planeta(Base):
    __tablename__ = 'planetas'

    id = Column(Integer, primary_key=True)
    nombre = Column(String, nullable=False)
    clima = Column(String)
    terreno = Column(String)

    personajes = relationship('Personaje', back_populates='planeta')

class Personaje(Base):
    __tablename__ = 'personajes'

    id = Column(Integer, primary_key=True)
    nombre = Column(String, nullable=False)
    especie = Column(String)
    
    planeta_id = Column(Integer, ForeignKey('planetas.id'))
    planeta = relationship('Planeta', back_populates='personajes')

DATABASE_URL = "sqlite:///starwars_blog.db"
engine = create_engine(DATABASE_URL, echo=True)

Base.metadata.create_all(bind=engine)
