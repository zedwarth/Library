require_relative 'library'
require_relative 'book'
require_relative 'user'

library = Library.new
book  = Book.new 'Great Expectations', 'Charles Dickens', 'An awesome book by some old English dude.'
book2 = Book.new 'Tom Sawyer', 'Mark Twain'
book3 = Book.new 'Rainbow Six', 'Tom Clancy'

library.add_book(book)
library.add_book(book2)
library.add_book(book3)

user = User.new 'Matt Buck'

#library.check_out user, book_not_in_lib
library.check_out user, book

#book.due_date = Time.now - (2*60*60*24*7)

library.check_out user, book2
#library.check_out user, book3

library.check_in user, book

puts library.books.inspect