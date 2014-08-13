require 'bookkeeper'

class User <Bookkeeper
  attr_reader :name, :id

  def initialize attributes
    @name = attributes['name']
    @id = attributes['id'].to_i
  end

end
