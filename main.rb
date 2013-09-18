require_relative 'library'
require_relative 'book'
require_relative 'user'

library = Library.new
book = Book.new 'Great Expectations', 'Charles Dickens', 'An awesome book by some old English dude.'
book_not_in_lib = Book.new 'Tom Sawyer', 'Mark Twain'

library.add_book(book)

user = User.new 'Matt Buck'

#library.check_out user, book_not_in_lib
library.check_out user, book


puts library.books.inspect