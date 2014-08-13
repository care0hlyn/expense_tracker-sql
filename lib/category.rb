require 'bookkeeper'

class Category <Bookkeeper
  attr_reader :name, :id

  def initialize attributes
    @name = attributes['name']
    @id = attributes['id'].to_i
  end

  def == another_category
    self.id == another_category.id &&
    self.name == another_category.name
  end
end
