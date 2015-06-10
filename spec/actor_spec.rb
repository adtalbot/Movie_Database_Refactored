require('spec_helper')

describe(Actor) do
  describe('#initialize') do
    it('is initialized with a name') do
      test_actor = Actor.new({:name => 'Brad Pitt', :id => nil})
      expect(test_actor).to(be_an_instance_of(Actor))
    end
  end
end
