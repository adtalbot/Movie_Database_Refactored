class Movie
  attr_reader(:name, :id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
  end

  define_singleton_method(:all) do
    found_movies = DB.exec('SELECT * FROM movies;')
    movies = []
    found_movies.each do |found_movie|
      name = found_movie.fetch('name')
      id = found_movie.fetch('id').to_i()
      movies.push(Movie.new({:name => name, :id => id}))
    end
    movies
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO movies (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first().fetch('id').to_i
  end

  define_method(:==) do |another_movie|
    self.name().==(another_movie.name()).&(self.id().==(another_movie.id()))
  end

  define_singleton_method(:find) do |id|
    result = DB.exec("SELECT * FROM movies WHERE id = #{id};")
    name = result.first().fetch("name")
    Movie.new({:name => name, :id => id})
  end
end
