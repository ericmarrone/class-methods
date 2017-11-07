class BankAccount
  @@interest_rate = 0.0
  @@accounts = []

  def initialize
    @balance = 0
  end

  #READERS

    def balance
      @balance
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

  def self.create(account_name)
    new_account = BankAccount.new(account_name)
    @@accounts << new_account
    return new_account
  end

  def self.total_funds
    total = 0
    @@accounts.each do |account|
      total += account.balance
    end
  end
