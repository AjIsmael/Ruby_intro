class Warrior
  attr_accessor :name, :hp, :mp, :atk, :magic, :status
  def initialize(name)
    @name = name
    self.hp = 100
    self.mp = 10
    self.atk = 30
    self.magic = 5
    self.status = "alive"
  end

  def attack(target)
    target.hp -= self.atk
    puts "#{@name} attacked #{target.name}"
    target.status = fallen
    if target.hp < 1
      puts "#{target.name} has fallen!"
    end
  end
end

class Mage
  attr_accessor :name, :hp, :mp, :atk, :magic, :status
  def initialize(name)
    @name = name
    self.hp = 60
    self.mp = 100
    self.atk = 10
    self.magic = 40
    self.status = "alive"
  end

  def cast_spell(target)
    target.hp -= self.magic
    puts "#{@name} casted Firaga on #{target.name}"
    if target.hp < 1
      target.status = fallen
      puts "#{target.name} has burned!"
    end
  end
end

def start_battle(p1,p2)
  puts "Battle begins!"
  battle_time = true
  while battle_time
    if p1. status == 'fallen' || p2.status == 'fallen'
      puts "The battle is over"
      break
    end
    puts "Select an action\n1-Attack\n2-Pass\n3-Quit"
    answer = gets.chomp.to_i
    if answer == 1
      puts "you  attacked"
    elsif answer == 2
      puts "skipping turn ..."
    elsif answer == 3
      puts "Exiting game"
      battle_time = false
    else
      puts "Invalid input"
    end
  end
end
