class Book
  @@on_shelf = []
  @@on_loan = []


  def initialize(title, author, isbn)
    @title = title
    @author = author
    @isbn = isbn
    @due_date = nil
  end





  #READERS
  def due_date
    @due_date

  end


  #WRITERS
  def due_date=(date)
    @due_date = date
  end


  #INSTANCE and CLASS METHODS

  def lent_out?
    if @@on_loan.include?(self)
      return true
    else
      return false
    end
  end

  def return_to_library
    if lent_out?
      @@on_loan.delete(self)
      @@on_shelf << self
      self.due_date = nil
      return true
    else
      return false
    end
  end


  def self.create(title, author, isbn)
    new_book = Book.new(title, author, isbn)
    @@on_shelf << new_book
    return new_book
  end

  def self.available
    @@on_shelf

  end

  def self.current_due_date
    @@on_loan.each do |book|
      book.due_date = Time.now + (60 * 60 * 24 * 3)
    end
  end

  def borrow
    if lent_out?
      return false
    else
      @@on_shelf.delete(self)
      @@on_loan << self
      self.class.current_due_date
      return true
    end

  end

  def self.borrowed
    @@on_loan
  end

  def self.overdue
    overdue_books = []
    @@on_loan.each do |book|
      if book.due_date < Time.now
        overdue_books << book
      else
      end
    end
    return overdue_books
  end

  def self.browse
    @@on_shelf.sample
  end


end


book1 = Book.create("hello", "eric", 100)
book2 = Book.create("goodbye", "eric", 12322)
# p Book.available
#
# p Book.browse
book1.borrow
book1.due_date = Time.now - (60 * 60 * 24 * 2)
# p book1.lent_out?
p book1.inspect
# # p Book.borrowed
# # p Book.available
# p book1.return_to_library.inspect
# book1.return_to_library
# p book1.inspect
# p Book.borrowed
# p Book.available
p Book.overdue
