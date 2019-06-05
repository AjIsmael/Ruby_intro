ALL_UNITS = []

class Unit
 attr_accessor :name, :hp, :mp, :speed, :ct, :maxhp, :maxmp, :atk, :status #getter and setter methods
 def initialize(name) #constructor method
   self.name = name
   self.hp = 50 #default value
   self.mp = 10
   self.atk = 10
   self.speed  = 5
   self.ct = 0
   self.maxhp = 50
   self.maxmp = 10
   self.status = "alive"
   ALL_UNITS << self
 end

 def attack(target) # method
   puts "#{self.name} attacked #{target.name}"
 end
end

class Squire < Unit #inheritence
 def initialize(name)
   super(name) #function that calls the superclass's constructor
 end
# we can specify unique methods
# or override a method from parent class by using the same name
 def throw_stone(target)
   puts "#{self.name} threw a stone..."
 end
end

class Wizard < Unit
 def initialize(name)
   super(name)
   self.hp -= 10
   self.speed -= 2
   self.mp += 30
 end

 def cast()
   puts "#{self.name} casted magic"
 end
end

class Knight < Unit
 def initialize(name)
   super(name)
   self.hp += 10
   self.atk += 5
   self.mp -= 5
 end

 def rend_armor()
   puts "#{self.name} rend armor! Everything is now rent!"
 end
end

def battle_is_over? # boolean function/methods. The "?" is for readability.
 dead_units = []
 ALL_UNITS.each do |unit|
   if unit.status == "alive"
     dead_units << false
   else
     dead_units << true
   end
 end
 if dead_units.count(false) > 1
   return false #it is important to return a boolean value
 end
end

def take_turn(u)
 puts "#{u.name}'s turn! What will you do?"
 puts "1 - Attack\n2 -Special\n3 - Wait"
 choice = gets.chomp.to_i
 case choice #cleaner syntax for if else statement
 when 1
   puts "#{u.name} attacked"
 when 2
   puts "#{u.name} used a Special move"
 when 3
   puts "Waiting..."
 else
   puts "Invalid Selection"
 end
end

def start_battle
 battle_time = true
 while battle_time
   if battle_is_over?
     break
   end
   ALL_UNITS.each do |unit|
     unit.ct += unit.speed
     sleep 0.1 # sleep will stall execution of the program for n seconds
     puts "#{unit.name}.......#{unit.ct}/100"
     if unit.ct >= 100
       take_turn(unit)
       unit.ct = 0
     end
   end
 end
end

roy = Knight.new('Roy') #object.new is how we run a class's constructor method
robin = Wizard.new('Robin')
marth = Squire.new('Marth')

start_battle
