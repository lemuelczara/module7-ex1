DROP TABLE IF EXISTS actors CASCADE;
DROP TABLE IF EXISTS nationalities CASCADE;
DROP TABLE IF EXISTS directors CASCADE;
DROP TABLE IF EXISTS movies CASCADE;
DROP TABLE IF EXISTS movies_actors;

CREATE TABLE actors(
    id SERIAL NOT NULL,
    name VARCHAR(50) NOT NULL,

    CONSTRAINT pk_actors PRIMARY KEY(id)
);

CREATE TABLE nationalities(
    id SERIAL NOT NULL,
    initials CHAR(2) NOT NULL,

    CONSTRAINT pk_nationalities PRIMARY KEY(id)
);

CREATE TABLE directors(
    id SERIAL NOT NULL,
    name VARCHAR(50) NOT NULL,

    CONSTRAINT pk_directors PRIMARY KEY(id)
);

CREATE TABLE movies(
    id SERIAL NOT NULL,
    name VARCHAR(50) NOT NULL,
    release_date DATE NOT NULL,
    nationality_id INTEGER NOT NULL,
    director_id INTEGER NOT NULL,

    CONSTRAINT pk_movies PRIMARY KEY(id),
    CONSTRAINT fk_movies_nationalities FOREIGN KEY(nationality_id) REFERENCES nationalities(id),
    CONSTRAINT fk_movies_directors FOREIGN KEY(director_id) REFERENCES directors(id)
);

CREATE TABLE movies_actors(
    id SERIAL NOT NULL,
    movie_id INTEGER NOT NULL,
    actor_id INTEGER NOT NULL,

    CONSTRAINT pk_movies_actors PRIMARY KEY(id),
    CONSTRAINT fk_movies_actors_movies FOREIGN KEY(movie_id) REFERENCES movies(id),
    CONSTRAINT fk_movies_actors_actors FOREIGN KEY(actor_id) REFERENCES actors(id)
);
