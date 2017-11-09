class Vampire
  @@coven = []
  # attr_reader :name, :age, :in_coffin, :drank_blood_today
  def initialize(name, age)
    @name = name
    @age = age
    @in_coffin = false
    @drank_blood_today = false
  end

  def name
    @name
  end

  def age
    @age
  end

  def in_coffin
    @in_coffin
  end

  def drank_blood_today
    @drank_blood_today
  end

  def self.create(name, age)
    new_vampire = Vampire.new(name, age)
    @@coven << new_vampire
    new_vampire
  end

  def drink_blood
    @drank_blood_today = true
  end

  def go_home
    @in_coffin = true
  end

  def self.sunrise
    @@coven.each do |vampire|
        if vampire.in_coffin || vampire.drank_blood_today == false
          @@coven.delete(vampire)
        end
    end
  end
  def self.sunset

  end

  def self.all
    @@coven
  end
end

bob = Vampire.create("bob", 30)
george = Vampire.create("george", 32)
roco = Vampire.create("roco", 21)
brenda = Vampire.create("brenda", 42)
# puts bob.inspect
bob.drink_blood
bob.go_home
roco.go_home
brenda.go_home
brenda.drink_blood
# puts bob.inspect
Vampire.sunrise
puts Vampire.all.inspect
