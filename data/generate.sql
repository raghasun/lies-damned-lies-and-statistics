drop table if exists places;
create table places(place text primary key, province text not null, population int);

drop table if exists stores;
create table stores(store text primary key, province text not null, zip text not null, profit int);

\i data/generated.sql

analyse;
