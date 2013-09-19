require_relative 'library'
require_relative 'book'
require_relative 'user'

library = Library.new
great_expectations  = Book.new 'Great Expectations', 'Charles Dickens', 'An awesome great_expectations by some old English dude.'
tom_sawyer = Book.new 'Tom Sawyer', 'Mark Twain'
rainbow_six = Book.new 'Rainbow Six', 'Tom Clancy'

library.add_book(great_expectations)
library.add_book(tom_sawyer)
library.add_book(rainbow_six)

books = [great_expectations, tom_sawyer, rainbow_six]

user = User.new 'Matt Buck'

#library.check_out user, great_expectations_not_in_lib
library.check_out user, great_expectations

library.check_out user, tom_sawyer
#library.check_out user, rainbow_six

#great_expectations.due_date = Time.now - (2*60*60*24*1000)
#tom_sawyer.reported_lost = true

books.each do |b|
  puts b.title
  puts b.status
end

library.list_checked_out_books