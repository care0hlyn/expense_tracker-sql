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

 def self.all

  if self.class == Purchase
      results = DB.exec("SELECT * FROM purchases;")
        purchases = []
      results.each do |result|
        purchase = Purchase.new(result)
        purchases << purchase
      end
    purchases
  elsif self.class == User
      results = DB.exec("SELECT * FROM users;")
        users = []
      results.each do |result|
        user = Users.new(result)
        users << user
      end
      users
  end
 end

end
