require 'spec_helper'

describe Category do
  it 'initializes with a category name' do
    test_category = Category.new({'name' => 'toys'})
    expect(test_category).to be_an_instance_of Category
    expect(test_category.name).to eq 'toys'
  end

  it 'saves a category to the database' do
    test_category = Category.new({'name' => 'toys'})
    test_category.save
    expect(Category.all).to eq [test_category]
  end

end
