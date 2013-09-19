class Library
  attr_reader :books, :checked_out_books

  CHECK_OUT_INTERVAL = 60*60*24*7

  def initialize
    @books = []
    @checked_out_books = []
  end

  # Adds a book to the library.
  #
  # book - The Book to be added.
  #
  # Returns the Array of books.
  def add_book(book)
    book.library = self

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
    book.user = user
    user.books << book
    @checked_out_books << book
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

  # Returns an Array of overdue books.
  def overdue_books
    @checked_out_books.select { |book| book.overdue? }
  end

  # Outputs a list of books with due date and user.
  def list_checked_out_books
    @checked_out_books.each do |book|
      puts "#{book.title}: checked out by #{book.user.name}, due on #{book.due_date}"
    end
  end
end