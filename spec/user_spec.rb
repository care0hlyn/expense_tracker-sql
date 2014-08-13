require 'spec_helper'


describe User do
  it 'should create name in database' do
    test_user = User.new({'name' => "Amy V."})
    expect(test_user).to be_an_instance_of User
    expect(test_user.name).to eq "Amy V."
  end

  it 'saves a user to the database' do
    test_user = User.new({'name' => "Carolyn H."})
    test_user.save
    expect(User.all).to eq [test_user]
  end
end
