require 'spec_helper'
require 'pry'

describe Category do
  it 'initializes with a category name' do
    test_category = Category.new({'name' => 'toys'})
    expect(test_category).to be_an_instance_of Category
    expect(test_category.name).to eq 'toys'
  end

  it 'is the same category if it has the same name' do
    test_category1 = Category.new({'name' => 'toys'})
    test_category2 = Category.new({'name' => 'toys'})
    expect(test_category1).to eq test_category2
  end

  it 'saves a category to the database' do
    test_category = Category.new({'name' => 'toys'})
    test_category.save
    expect(Category.all).to eq [test_category]
  end

  it 'associates a category id to a purchase' do
    test_category = Category.new({'name' => 'toys'})
    test_category.save
    test_purchase = Purchase.new({'amount' => 599, 'description' => 'kiteboard', 'date_of_purchase' => '2014-11-07', 'category_id' => test_category.id})
    test_purchase.save
    test_category.add_purchase(test_purchase)
    # binding.pry
    expect(test_category.purchases).to eq [test_purchase]
  end

end
