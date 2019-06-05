class User
  attr_writer :name, :email
  attr_reader :name, :email
  def initialize(name, email)
    @name = name
    @email = email
  end
end

user = User.new("morgan", "morganfox61297@gmail.com")
user2 = User.new("matthew", "mpawson@gmail.com")
user.name = "Morgan"
puts user.name
puts user2.name
