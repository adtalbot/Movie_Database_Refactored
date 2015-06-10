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

  describe(".find") do
    it('returns a actor by its id number') do
      test_actor = Actor.new({:name => "Brad Pitt", :id => nil})
      test_actor.save()
      test_actor2 = Actor.new({:name => "George Clooney", :id => nil})
      test_actor2.save()
      expect(Actor.find(test_actor2.id())).to(eq(test_actor2))
    end
  end
  describe('#save') do
    it('saves an actor to the database') do
      test_actor = Actor.new({:name => 'Brad Pitt', :id => nil})
      test_actor.save()
      expect(Actor.all()).to(eq([test_actor]))
    end
  end
  describe('#==') do
    it('returns true if two actors have the same name and same id') do
      test_actor = Actor.new({:name => 'Brad Pitt', :id => nil})
      test_actor2 = Actor.new({:name => 'Brad Pitt', :id => nil})
      expect(test_actor).to(eq(test_actor2))
    end
  end

  describe('#update') do
    it('lets you update actors in the database') do
      actor = Actor.new({:name => 'George Clooney', :id => nil})
      actor.save()
      actor.update({:name => "Brad Pitt", :id => nil})
      expect(actor.name()).to(eq("Brad Pitt"))
    end
  end
end
