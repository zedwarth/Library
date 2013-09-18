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

    book.due_date = Time.now + CHECK_OUT_INTERVAL
    book.user     = user
  end
end