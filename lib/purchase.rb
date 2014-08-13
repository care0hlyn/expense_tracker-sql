require 'pry'
require 'bookkeeper'

class Purchase <Bookkeeper

  attr_reader :id, :amount, :description, :category_id, :date_of_purchase

  def initialize attributes
    @id = attributes['id'].to_i
    @amount = attributes['amount'].to_i
    @category_id = attributes['category_id'].to_i
    @description = attributes['description']
    @date_of_purchase = attributes['date_of_purchase']
  end

  def ==(another_purchase)
    self.id == another_purchase.id &&
    self.amount == another_purchase.amount &&
    self.category_id == another_purchase.category_id &&
    self.description == another_purchase.description &&
    self.date_of_purchase == another_purchase.date_of_purchase
  end


end
