class Zombie
  @@horde = []
  @@plague_level = 10
  @@max_speed = 5
  @@max_strength = 8
  @@default_speed = 1
  @@default_strength = 3
  @@next_id = 1

  def initialize(speed, strength)
    @speed = speed
    if speed > @@max_speed
      @speed = @@default_speed
    end
    @strength = strength
    if strength > @@max_strength
      @strength = @@default_strength
    end
    @id = @@next_id
    @@next_id += 1
  end

  def encounter
    if outrun_zombie?
      puts "You escaped!"
    elsif survive_attack? == false
      puts "You were killed by the zombie!"
    else
      you = Zombie.new(1,3)
      @@horde << you
      puts "You were turned into a zombie!"
    end
  end

  def outrun_zombie?
    if @speed < rand(@@max_speed)
      return true
    else
      return false
    end
  end

  def survive_attack?
    if @strength < rand(@@max_strength)
      return true
    else
      return false
    end
  end

  def self.all
    @@horde
  end

  def self.new_day
    self.some_die_off
    self.spawn
    self.increase_plague_level
  end

  def self.some_die_off
    @@horde.pop(rand(11))
  end

  def self.spawn
    rand(3..@@plague_level).times do
      zombie = Zombie.new(rand(@@max_speed), rand(@@max_strength))
      @@horde << zombie
    end
  end

  def self.increase_plague_level
    @@plague_level += rand(3)
  end

end

# x = Zombie.new(2,3)
# puts Zombie.spawn.inspect
# puts Zombie.all.inspect
# puts x.inspect

puts Zombie.all.inspect
Zombie.new_day
puts Zombie.all.inspect
zombie1 = Zombie.all[0]
zombie2 = Zombie.all[1]
zombie3 = Zombie.all[2]
zombie1.encounter
zombie2.encounter
zombie3.encounter
