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

  def save
    results = DB.exec("INSERT INTO purchases (amount, description, date_of_purchase) VALUES (#{@amount}, '#{@description}', '#{@date_of_purchase}') RETURNING id;")
    @id = results.first['id'].to_i
  end

  def self.all
    results = DB.exec("SELECT * FROM purchases;")
      purchases = []
    results.each do |result|
      id = result['id']
      amount = result['amount'].to_i
      description = result['description']
      date_of_purchase = result['date_of_purchase']
      purchase = Purchase.new({:id => id, :amount => amount, :description => description, :date_of_purchase => date_of_purchase})
      purchases << purchase
    end
    purchases
  end
end
