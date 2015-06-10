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
    it('updates the attributes of the instance') do
      test_movie = Movie.new({:name => 'Oceans Twelve', :id => nil})
      test_movie.save()
      test_movie.update({:name => 'Oceans Eleven', :id => nil})
      expect(test_movie.name()).to(eq('Oceans Eleven'))
    end
  end
end
