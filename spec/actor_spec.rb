require('spec_helper')

describe(Actor) do
  describe('#initialize') do
    it('is initialized with a name') do
      test_actor = Actor.new({:name => 'Brad Pitt', :id => nil})
      expect(test_actor).to(be_an_instance_of(Actor))
    end
    it('can be initialized with its database ID') do
      test_actor = Actor.new({:name => 'Brad Pitt', :id => 1})
      expect(test_actor).to(be_an_instance_of(Actor))
    end
  end

  describe(".all") do
    it("starts off with no movies") do
      expect(Actor.all()).to(eq([]))
    end
  end
end
