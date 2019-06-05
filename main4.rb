$all_users = Array.new

class User
  def initialize(name)
    @name = name
    $all_users << self
  end

  def name
    @name
  end

  
end

user = User.new("Morgan")
user = User.new("Morgan 2")
puts user.name
puts $all_users
