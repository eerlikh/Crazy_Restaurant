# load my postgres ruby adapter
require 'pg'
path_to_seed_dir = '/Users/rafacode/Desktop/w5d3/movielens/seed_data/'

# connect to our postgres facilities and create the tables

# psql postgres
conn = PG.connect(dbname: 'postgres')


# create our movielens database
conn.exec("DROP DATABASE IF EXISTS movielens;")
conn.exec("CREATE DATABASE movielens;")
conn.close


# \c movielens
conn = PG.connect(dbname: 'movielens')

# id | user id | movie id | rating | timestamp.
conn.exec("CREATE TABLE ratings (
  id SERIAL PRIMARY KEY,
  user_id integer NOT NULL,
  movie_id integer NOT NULL,
  rating integer NOT NULL,
  timestamp integer
)")

# import
conn.exec("COPY ratings (user_id, movie_id, rating, timestamp)
FROM '#{path_to_seed_dir}ratings.data' with (format csv, delimiter '\t')")


#create the movies table
# movie id | movie title | release date | video release date |
# IMDb URL | unknown | Action | Adventure | Animation |
# Children's | Comedy | Crime | Documentary | Drama | Fantasy |
# Film-Noir | Horror | Musical | Mystery | Romance | Sci-Fi |
# Thriller | War | Western

conn.exec("CREATE TABLE movies (
  id SERIAL PRIMARY KEY,
  title VARCHAR(255),
  release_date VARCHAR(255),
  video_release_date VARCHAR(255),
  imdb_url VARCHAR(255),
  gen_unknown INTEGER,
  gen_action INTEGER,
  gen_adventure INTEGER,
  gen_animation INTEGER,
  gen_children INTEGER,
  gen_comedy INTEGER,
  gen_crime INTEGER,
  gen_documentary INTEGER,
  gen_drama INTEGER,
  gen_fantasy INTEGER,
  gen_film_noir INTEGER,
  gen_horror INTEGER,
  gen_musical INTEGER,
  gen_mystery INTEGER,
  gen_romance INTEGER,
  gen_scifi INTEGER,
  gen_thriller INTEGER,
  gen_war INTEGER,
  gen_western INTEGER
)")


conn.exec("COPY movies (id, title, release_date, video_release_date, imdb_url, gen_unknown,
gen_action, gen_adventure, gen_animation, gen_children, gen_comedy, gen_crime,
gen_documentary, gen_drama, gen_fantasy, gen_film_noir, gen_horror, gen_musical,
gen_mystery, gen_romance, gen_scifi, gen_thriller, gen_war, gen_western)
FROM '#{path_to_seed_dir}movies.data' with (format csv, delimiter '|');")


#create the users table
# user id | age | gender | occupation | zip code
conn.exec("CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  age integer,
  gender varchar,
  occupation varchar,
  zipcode varchar
);")

conn.exec("COPY users (id, age, gender, occupation, zipcode)
FROM '#{path_to_seed_dir}users.data' with (format csv, delimiter '|');")
