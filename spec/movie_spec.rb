require('spec_helper')


describe(Movie) do
  describe('#name') do
    it('tells you its name') do
      test_movie = Movie.new({:name => 'Braveheart', :id => nil})
      expect(test_movie.name()).to(eq('Braveheart'))
    end
  end

  describe('#id') do
    it('returns the id when you save it') do
      test_movie = Movie.new({:name => 'Braveheart', :id => nil})
      test_movie.save()
      expect(test_movie.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe('.all') do
    it('is empty at first') do
      expect(Movie.all()).to(eq([]))
    end
  end

  describe("#save") do
    it('saves a movie to the array') do
      test_movie = Movie.new({:name => 'Braveheart', :id => nil})
      test_movie.save()
      expect(Movie.all()).to(eq([test_movie]))
    end
  end

  describe('#==') do
    it('returns two movies as true if the name and id is the same') do
      test_movie = Movie.new({:name => 'Braveheart', :id => nil})
      test_movie2 = Movie.new({:name => 'Braveheart', :id => nil})
      expect(test_movie).to(eq(test_movie2))
    end
  end
  describe(".find") do
    it("returns a movie by its id") do
      test_movie = Movie.new({:name => "Oceans Eleven", :id => nil})
      test_movie.save()
      test_movie2 = Movie.new({:name => "Oceans twelve", :id => nil})
      test_movie2.save()
      expect(Movie.find(test_movie2.id())).to(eq(test_movie2))
    end
  end
  describe('#update') do
    it('updates the movies in the database') do
      test_movie = Movie.new({:name => 'Oceans Twelve', :id => nil})
      test_movie.save()
      test_movie.update({:name => 'Oceans Eleven', :id => nil})
      expect(test_movie.name()).to(eq('Oceans Eleven'))
    end

    it('lets you add an actor to a movie') do
      test_movie = Movie.new({:name => 'Oceans Eleven', :id => nil})
      test_movie.save()
      test_actor = Actor.new({:name => 'George Clooney', :id => nil})
      test_actor.save()
      test_actor2 = Actor.new({:name => 'Channing Tatem', :id => nil})
      test_actor2.save()
      test_movie.update({:actor_ids => [test_actor.id(), test_actor2.id()]})
      expect(test_movie.actors()).to(eq([test_actor, test_actor2]))
    end
  end

  describe("#delete") do
    it('deletes a movie from the database') do
      test_movie = Movie.new({:name => "Oceans Eleven", :id => nil})
      test_movie.save()
      test_movie2 = Movie.new({:name => "Oceans Twelve", :id => nil})
      test_movie2.save()
      test_movie.delete()
      expect(Movie.all()).to(eq([test_movie2]))
    end
  end
  describe('#actors') do
    it('returns all the actors for a particular movie') do
      test_movie = Movie.new({:name => 'Braveheart', :id => nil})
      test_movie.save()
      test_actor = Actor.new({:name => 'Mel Gibson', :id => nil})
      test_actor.save()
      test_actor2 = Actor.new({:name => 'Sean Connery', :id => nil})
      test_actor2.save()
      test_movie.update({:actor_ids => [test_actor.id(), test_actor2.id()]})
      expect(test_movie.actors()).to(eq([test_actor, test_actor2]))
    end
  end
end
