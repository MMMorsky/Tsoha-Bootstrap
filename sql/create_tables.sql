CREATE TABLE Vastuuhenkilo  (
  id SERIAL PRIMARY KEY,
  nimi VARCHAR(50) NOT NULL
);

CREATE TABLE Laitos (
  id SERIAL PRIMARY KEY,
  nimi VARCHAR(50) NOT NULL
);


CREATE TABLE Kurssi (
  id SERIAL PRIMARY KEY,
  laitos_id INTEGER REFERENCES Laitos(id),
  nimi VARCHAR(50) NOT NULL,
  aloituspaiva DATE
);


CREATE TABLE Kurssinvastuu (
  vastuuhenkilo_id INTEGER REFERENCES Vastuuhenkilo(id) ON UPDATE CASCADE ON DELETE CASCADE,
  kurssi_id INTEGER REFERENCES Kurssi(id) ON UPDATE CASCADE
);

CREATE TABLE Kysely (
  id SERIAL PRIMARY KEY,
  kurssi_id INTEGER REFERENCES Kurssi(id),
  kysymys5 VARCHAR(200),
  kysymys6 VARCHAR(200)
);

CREATE TABLE Vastaus (
  id SERIAL PRIMARY KEY,
  kysely_id INTEGER REFERENCES Kysely(id),
  vastaus1 INTEGER NOT NULL,
  vastaus2 INTEGER NOT NULL,
  vastaus3 INTEGER NOT NULL,
  vastaus4 INTEGER NOT NULL,
  vastaus5 VARCHAR(200) NOT NULL,
  vastaus6 VARCHAR(200) NOT NULL
)