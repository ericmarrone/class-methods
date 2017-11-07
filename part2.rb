class Book
  @@on_shelf = []
  @@on_loan = []

  def initialize(title, author, isbn)
    @title = title
    @author = author
    @isbn = isbn

  end





  #READERS
  def due_date
    @due_date

  end


  #WRITERS
  def due_date=(date)
    @due_date = date
  end


  #INSTANCE METHODS
  def borrow

  end

  def return_to_library

  end

  def lent_out?

  end


  #CLASS METHODS

  def self.create(title, author, isbn)
    new_book = Book.new(title, author, isbn)
    @@on_shelf << new_book
    return new_book
  end

  def self.available
    @@on_shelf

  end

  def self.current_due_date

  end

  def self.overdue_books

  end

  def self.browse

  end

  def self.borrowed

  end


end


p Book.create("hello", "eric", 123)
p Book.available
