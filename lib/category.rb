require 'bookkeeper'
require 'pry'

class Category <Bookkeeper
  attr_reader :name, :id, :purchases, :percentage

  def initialize attributes
    @name = attributes['name']
    @id = attributes['id'].to_i
    @purchases = []
    @percentage = attributes['percentage'].to_i
  end

  def == another_category
    self.id == another_category.id &&
    self.name == another_category.name
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

  def percentage
    combined_total = DB.exec("SELECT SUM(amount) AS combined_total FROM purchases;")
    category_total = DB.exec("SELECT SUM(amount) AS category_total FROM purchases WHERE category_id = #{@id};")
    total1 = combined_total.first['combined_total'].to_f
    total2 = category_total.first['category_total'].to_f
    @percentage = ((total2 / total1) * 100).ceil
  end

end
