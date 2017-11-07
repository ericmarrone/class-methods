class BankAccount
  @@interest_rate = 0.02
  @@accounts = []

  def initialize
    @balance = 0.0
  end

  #READERS

  def balance
    @balance
  end

  def self.accounts
    @@accounts
  end


  #WRITERS
  def balance=(balance)
    @balance = balance
  end


  #instance methods
  def deposit(number)
    @balance += number
  end

  def withdraw(number)
    @balance -= number
  end
  
  def self.create
    new_account = BankAccount.new
    @@accounts << new_account
    return new_account
  end

  def self.total_funds
    total = 0
    @@accounts.each do |account|
      total += account.balance
    end
    return total
  end

  def self.interest_time
    @@accounts.each do |account|
      account.balance *= 1.0 + @@interest_rate
    end
  end

end

my_account = BankAccount.create
your_account = BankAccount.create

# puts my_account.inspect
# puts your_account.inspect

puts BankAccount.accounts.inspect

puts my_account.balance
puts BankAccount.total_funds
my_account.deposit(200)
your_account.deposit(1000)
puts my_account.balance
puts your_account.balance
puts BankAccount.total_funds
BankAccount.interest_time
puts my_account.balance
puts your_account.balance
puts BankAccount.total_funds
my_account.withdraw(50)
puts my_account.balance
puts BankAccount.total_funds
# puts my_account.inspect
