class Library
  attr_reader :books

  CHECK_OUT_INTERVAL = 60*60*24*7

  def initialize
    @books = []
  end

  # Adds a book to the library.
  #
  # book - The Book to be added.
  #
  # Returns the Array of books.
  def add_book(book)
    @books << book
  end

  # Checks out a book for a user.
  #
  # user - The User checking out the book.
  # book - The Book to be checked out.
  #
  # Returns the checked out Book.
  def check_out(user, book)
    raise ArgumentError, "Book not in library." unless @books.include? book
    raise "User has too many books checked out." if user.books.size == 2 
    raise "User has overdue books." if user.books.any? { |book| book.overdue? }

    # Remove the book from the library.
    @books.delete(book)

    book.due_date = Time.now + CHECK_OUT_INTERVAL
    user.books << book
  end

  # Checks in a book for a user.
  #
  # user - The User checking in the book.
  # book - The Book to be checked in.
  #
  # Returns the checked in book.
  def check_in(user, book)
    @books << book
    book.due_date = nil
    user.books.delete(book)
  end
end