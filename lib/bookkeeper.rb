require 'rubygems'
require 'active_support/core_ext/string/inflections'
require 'pry'

class Bookkeeper

  def save
    if self.class == Purchase
      results = DB.exec("INSERT INTO purchases (amount, description, date_of_purchase) VALUES (#{@amount}, '#{@description}', '#{@date_of_purchase}') RETURNING id;")
      @id = results.first['id'].to_i
    elsif self.class == Category
      results = DB.exec("INSERT INTO categories (name) VALUES ('#{@name}') RETURNING id;")
      @id = results.first['id'].to_i
    end
  end

  def self.all
    table_name = self.to_s.downcase.pluralize
    results = DB.exec("SELECT * FROM #{table_name};")
      class_instances = []
    results.each do |result|
      class_instances << self.new(result)
    end
    class_instances
  end
end
