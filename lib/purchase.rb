require 'pry'
require 'bookkeeper'

class Purchase < Bookkeeper

  attr_reader :id, :amount, :description, :category_id, :date_of_purchase

  def initialize attributes
    @id = attributes['id'].to_i
    @amount = attributes['amount'].to_i
    @category_id = attributes['category_id'].to_i
    @description = attributes['description']
    @date_of_purchase = attributes['date_of_purchase']
  end

  def == another_purchase
    self.id == another_purchase.id &&
    self.amount == another_purchase.amount
  end

  def update new_description
    results = DB.exec("UPDATE purchases SET description = '#{new_description}' WHERE id = #{@id} RETURNING description;")
    @description = results.first['description']
  end

  def remove
    DB.exec("DELETE FROM purchases WHERE id = #{@id}")
  end

end
