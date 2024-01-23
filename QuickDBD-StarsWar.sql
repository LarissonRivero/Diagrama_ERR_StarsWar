-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/8PyGbO
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Usuario" (
    "id" interger   NOT NULL,
    "email" string   NOT NULL,
    "password" string   NOT NULL,
    "feacha_suscri" float   NOT NULL,
    "nombre" string   NOT NULL,
    "apellido" string   NOT NULL,
    CONSTRAINT "pk_Usuario" PRIMARY KEY (
        "id"
     ),
    CONSTRAINT "uc_Usuario_email" UNIQUE (
        "email"
    )
);

CREATE TABLE "Favorito" (
    "id" interger   NOT NULL,
    "usuario_id" int   NOT NULL,
    "tipo" string   NOT NULL,
    "planeta_id" int   NOT NULL,
    CONSTRAINT "pk_Favorito" PRIMARY KEY (
        "id","usuario_id","planeta_id"
     )
);

CREATE TABLE "Planeta" (
    "id" interger   NOT NULL,
    "nombre" string   NOT NULL,
    "clima" string   NOT NULL,
    "terreno" string   NOT NULL,
    CONSTRAINT "pk_Planeta" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Personaje" (
    "id" interger   NOT NULL,
    "nombre" string   NOT NULL,
    "especie" string   NOT NULL,
    "planeta_id" int   NOT NULL,
    CONSTRAINT "pk_Personaje" PRIMARY KEY (
        "id","planeta_id"
     )
);

ALTER TABLE "Favorito" ADD CONSTRAINT "fk_Favorito_usuario_id" FOREIGN KEY("usuario_id")
REFERENCES "Usuario" ("id");

ALTER TABLE "Favorito" ADD CONSTRAINT "fk_Favorito_planeta_id" FOREIGN KEY("planeta_id")
REFERENCES "Planeta" ("id");

ALTER TABLE "Personaje" ADD CONSTRAINT "fk_Personaje_planeta_id" FOREIGN KEY("planeta_id")
REFERENCES "Planeta" ("id");

