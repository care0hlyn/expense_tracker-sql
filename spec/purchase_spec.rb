require 'spec_helper'
require 'pry'

describe Purchase do
  it 'adds a purchase to the database' do
    test_purchase = Purchase.new({'amount' => 599, 'description' => 'kiteboard', 'date_of_purchase' => '2014-11-07'})
    expect(test_purchase).to be_an_instance_of Purchase
    expect(test_purchase.amount).to eq 599
    expect(test_purchase.description).to eq 'kiteboard'
    expect(test_purchase.date_of_purchase).to eq '2014-11-07'
  end

  it 'is the same purchase if it has the same attributes' do
    test_purchase1 = Purchase.new({'amount' => 599, 'description' => 'kiteboard', 'date_of_purchase' => '2014-11-07'})
    test_purchase2 = Purchase.new({'amount' => 599, 'description' => 'kiteboard', 'date_of_purchase' => '2014-11-07'})
    expect(test_purchase1).to eq test_purchase2
  end

  it 'saves the purchases to the database' do
    test_purchase = Purchase.new({'amount' => 599, 'description' => 'kiteboard', 'date_of_purchase' => '2014-11-07'})
    test_purchase.save
    expect(Purchase.all).to eq [test_purchase]
  end



end
