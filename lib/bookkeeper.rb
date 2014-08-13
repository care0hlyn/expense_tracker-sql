require 'rubygems'
require 'active_support/core_ext/string/inflections'
require 'pry'

class Bookkeeper

  def save
    if self.class == Purchase
      results = DB.exec("INSERT INTO purchases (amount, description, date_of_purchase) VALUES (#{@amount}, '#{@description}', '#{@date_of_purchase}') RETURNING id;")
      @id = results.first['id'].to_i
    elsif self.class == User || self.class == Category
      table_name = self.class.to_s.downcase.pluralize
      results = DB.exec("INSERT INTO #{table_name} (name) VALUES ('#{@name}') RETURNING id;")
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
