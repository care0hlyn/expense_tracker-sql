require 'spec_helper'

describe Category do
  it 'initializes with a category name' do
    test_category = Category.new({'name' => 'toys'})
    expect(test_category).to be_an_instance_of Category
    expect(test_category.name).to eq 'toys'
  end
end
