require 'bookkeeper'
require 'pry'

class Category <Bookkeeper
  attr_reader :name, :id, :purchases

  def initialize attributes
    @name = attributes['name']
    @id = attributes['id'].to_i
    @purchases = []
  end

  def == another_category
    self.id == another_category.id &&
    self.name == another_category.name &&
    self.purchases == another_category.purchases
  end

  def add_purchase(purchase)
    DB.exec("UPDATE purchases SET category_id = #{self.id} WHERE id = #{purchase.id};")
    purchase.instance_variable_set('@category_id', @id)
  end

  def purchases
    results = DB.exec("SELECT * FROM purchases WHERE category_id = #{@id};")
    results.each do |result|
      @purchases << Purchase.new(result)
    end
    @purchases
  end

end
