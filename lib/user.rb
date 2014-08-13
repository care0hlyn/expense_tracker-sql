require 'bookkeeper'

class User <Bookkeeper
  attr_reader :name, :id

  def initialize attributes
    @name = attributes['name']
    @id = attributes['id'].to_i
  end

  def == another_user
    self.name == another_user.name &&
    self.id == another_user.id
  end

  # def self.all
  #   results = DB.exec("SELECT * FROM users;")
  #     users = []
  #   results.each do |result|
  #     user = User.new(result)
  #     users << user
  #   end
  #   users
  # end

end
