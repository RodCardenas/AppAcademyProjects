require 'singleton'
require 'sqlite3'

class MovieDatabase < SQLite3::Database
  include Singleton

  def initialize
    super(File.dirname(__FILE__) + "/../movie.db")

    self.results_as_hash = true
    self.type_translation = true
  end

  def self.execute(*args)
    self.instance.execute(*args)
  end
end

# 1. Obtain the cast list for the movie 'Rain Man'; order by the actors'
#    names.
def rain_man_cast
  MovieDatabase.execute(<<-SQL)
    select actor.name
    from movie
    join casting on movie.id = casting.movieid
    join actor on actor.id = casting.actorid
    where movie.title = 'Rain Man'
    order by actor.name
  SQL
end

# 2. List the films in which 'Harrison Ford' has appeared; order by
# movie title.
def harrison_ford_films
  MovieDatabase.execute(<<-SQL)
    select movie.title
    from movie
    join casting on movie.id = casting.movieid
    join actor on actor.id = casting.actorid
    where actor.name = 'Harrison Ford'
    order by movie.title
  SQL
end

# 3. List the films where 'Matt Damon' has appeared, but not in the
# star role. Order by movie title.
def matt_damon_supporting_actor_films
  MovieDatabase.execute(<<-SQL)
    select movie.title
    from movie
    join casting on movie.id = casting.movieid
    join actor on actor.id = casting.actorid
    where actor.name = 'Matt Damon' and ord != 1
    order by movie.title
  SQL
end

# 4. List the films together with the leading star for all 1962
# films. Order by movie title.
def leading_star_for_1962_films
  MovieDatabase.execute(<<-SQL)
    select movie.title, actor.name
    from movie
    join casting on movie.id = casting.movieid
    join actor on actor.id = casting.actorid
    where ord = 1 and yr = 1962
    order by movie.title
  SQL
end

# 5. There is a movie from 1920 in our database for which there is no
#    associated casting information. Give the title of this movie.
def no_casting_info
  MovieDatabase.execute(<<-SQL)
    select movie.title
    from movie
    left join casting on movie.id = casting.movieid
    where yr = 1920 and actorid is null
    group by movie.title
  SQL
end

# 6. Which films have more than 60 roles? List the movie title and
# number of roles. Order by movie title.
def big_movies
  MovieDatabase.execute(<<-SQL)
    select movie.title, count(actor.name) as roles
    from movie
    join casting on movie.id = casting.movieid
    join actor on actor.id = casting.actorid
    group by movieid
    having roles > 60
    order by movie.title
  SQL
end

# 7. List the movie year, movie title, and supporting actor (ord = 2)
# for all of the films in which Will Smith played the star role
# (ord = 1). Order by the name of the supporting actor.
def will_smith_supporting_actors
  MovieDatabase.execute(<<-SQL)
    select movie.yr, movie.title, actor.name
    from movie
    join casting on movie.id = casting.movieid
    join actor on actor.id = casting.actorid
    where ord = 2 and movie.title in
      (
        select movie.title
        from movie
        join casting on movie.id = casting.movieid
        join actor on actor.id = casting.actorid
        where actor.name = 'Will Smith' and ord = 1
      )
    order by actor.name
  SQL
end

# 8. Which were the busiest years for 'John Travolta'? List the year
# and the number of movies he made each year, for any year in which he
# made >2 movies. Order by year.
def busiest_john_travolta_years
  MovieDatabase.execute(<<-SQL)
    select movie.yr, count(movie.title) as count
    from movie
    join casting on movie.id = casting.movieid
    join actor on actor.id = casting.actorid
    where actor.name = 'John Travolta'
    group by movie.yr
    having count > 2
    order by movie.yr
  SQL
end
