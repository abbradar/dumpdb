#!/usr/bin/env python3

from sqlalchemy import Column, String, Integer
from sqlalchemy.ext.declarative import declarative_base
import sqlalchemy
import json
 
Base = declarative_base()

class Person(Base):
  __tablename__ = "person"

  id = Column(Integer, primary_key=True)
  name = Column(String, nullable=False)
  age = Column(Integer, nullable=False)

connstr = "postgresql+psycopg2://shlomo:@/shlomo"
outfile = "output.json"

engine = sqlalchemy.create_engine(connstr, execution_options={ "stream_results": True })

Base.metadata.create_all(engine)
Session = sqlalchemy.orm.sessionmaker()
Session.configure(bind=engine)
session = Session()

with open(outfile, "w") as of:
  # Not a joke, SQLAlchemy really needs this to be manually specified D:
  for record in session.query(Person).yield_per(1000):
    t = { 'id': record.id,
          'name': record.name,
          'age': record.age
        }
    json.dump(t, of)
 
session.close()