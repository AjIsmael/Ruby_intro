$ALL_FIGHTERS = [ ]
$EQUIPMENTS = ["boots", "sword"]
class Warrior
  attr_accessor :name, :hp, :mp, :atk, :magic, :status, :speed, :ct,:equ
  def initialize(name)
    @name = name
    self.hp = 100
    self.mp = 10
    self.atk = 30
    self.magic = 5
    self.status = "alive"
    self.speed = 7
    self.ct = 0
    self.equ = []
    $ALL_FIGHTERS << self
  end

  def attack(target)
    target.hp -= self.atk
    puts "#{@name} attacked #{target.name}"
    if target.hp < 1
      target.status = 'fallen'
      $ALL_FIGHTERS.delete(target)
      puts "#{target.name} has fallen!"
    end
  end

  def equip()
    puts "What do you want to equip #{self.name}"
    for equipment in $EQUIPMENTS
      puts equipment
    end
    equipped = gets.chomp.to_i
    self.equ << $EQUIPMENTS[equipped]

  end
end

class Mage
  attr_accessor :name, :hp, :mp, :atk, :magic, :status, :speed, :ct
  def initialize(name)
    @name = name
    self.hp = 60
    self.mp = 100
    self.atk = 10
    self.magic = 40
    self.status = "alive"
    self.ct = 0
    self.speed = 5
    $ALL_FIGHTERS << self
  end

  def cast_spell(target)
    target.hp -= self.magic
    puts "#{@name} casted Firaga on #{target.name}"
    if target.hp < 1
      target.status = 'fallen'
      $ALL_FIGHTERS.delete(target)
      puts "#{target.name} has burned!"
    end
  end
end

def take_turn(player)
  if player.class == Warrior
    puts "\n #{player.name}'s turn! Select an action\n1-Attack\n2-Pass\n3-Quit"
    answer = gets.chomp.to_i
    if answer == 1
      puts "who will you attack"
      for fighter in $ALL_FIGHTERS
        if fighter.name == player.name
          puts "self attack"
        else
          puts "#{fighter.name}"
        end
      end
      target = gets.chomp.to_i
      if target > ($ALL_FIGHTERS.length - 1)
        puts "You missed dump ass"
      else
        player.attack($ALL_FIGHTERS[target])
      end
    elsif answer == 2
      puts "skipping turn ..."
    elsif answer == 3
      puts "Exiting game"
      $battle_time = false
    else
      puts "Invalid input"
    end
  else
    puts "Select an action\n1-Cast Spell\n2-Pass\n3-Quit"
    answer = gets.chomp.to_i
    if answer == 1
      puts "#{player.name} casted magic"
      player.cast_spell(t)
    elsif answer == 2
      puts "skipping turn ..."
    elsif answer == 3
      puts "Exiting game"
      $battle_time = false
    else
      puts "Invalid input"
    end
  end
end

def start_battle(fighters)
  puts "Battle begins!"
  $battle_time = true
  turn_count = 0
  while $battle_time
    fighters.each do |fighter|
      fighter.ct += fighter.speed
      if fighter.ct >= 100
        take_turn(fighter)
      end
    end

  end
end
