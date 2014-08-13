require 'pry'

class Purchase

  attr_reader :id, :amount, :description, :date_of_purchase

  def initialize attributes
    @id = attributes[:id].to_i
    @amount = attributes[:amount]
    @description = attributes[:description]
    @date_of_purchase = attributes[:date_of_purchase]
  end

  def ==(another_purchase)
    self.id == another_purchase.id &&
    self.amount == another_purchase.amount &&
    self.description == another_purchase.description &&
    self.date_of_purchase == another_purchase.date_of_purchase
  end

end
