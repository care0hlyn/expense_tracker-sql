require 'rubygems'
require 'active_support/core_ext/string/inflections'
require 'pry'

class Bookkeeper

  def save
    if self.class == Purchase
      results = DB.exec("INSERT INTO purchases (amount, description, date_of_purchase) VALUES (#{@amount}, '#{@description}', '#{@date_of_purchase}') RETURNING id;")
      @id = results.first['id'].to_i
    elsif self.class == User
      results = DB.exec("INSERT INTO users (name) VALUES ('#{@name}') RETURNING id;")
      @id = results.first['id'].to_i
    end
  end

end
