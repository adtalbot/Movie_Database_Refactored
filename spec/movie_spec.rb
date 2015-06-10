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
    it('saves a movie the the array') do
      test_movie = Movie.new({:name => 'Braveheart', :id => nil})
      test_movie.save()
      expect(Movie.all()).to(eq(test_movie))
    end
  end
end
