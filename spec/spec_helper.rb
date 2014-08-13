require 'purchase'
require 'user'
require 'bookkeeper'
require 'category'
require 'rspec'
require 'pg'

DB = PG.connect({:dbname => 'purchases_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM users*;")
    DB.exec("DELETE FROM purchases*;")
    DB.exec("DELETE FROM categories*;")
  end
end

