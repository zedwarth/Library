require_relative "library.rb"

puts "Creating library..."
mks_lib = Library.new("The MakerSquare Library")
puts "-------------------------"

puts "Creating borrowers..."
mike = Borrower.new("Mike")
ricardo = Borrower.new("Ricardo")
gilbert = Borrower.new("Gilbert")
puts "-------------------------"

puts "Creating books..."
stranger = Book.new("The Stranger", "Albert Camus")
nausea = Book.new("Nausea", "Jean-Paul Sartre")
karamazov = Book.new("The Brothers Karamazov", "Fyodor Dostoesvky")
feynman = Book.new("Surely You're Joking Mr. Feynman", "Richard Feynman")
finnegan = Book.new("Finnegans Wake", "James Joyce")
k_and_r = Book.new("The C Programming Language", "Kernighan and Ritchie")
puts "-------------------------"

puts "Adding books to the library..."
mks_lib.add_book(stranger)
mks_lib.add_book(nausea)
mks_lib.add_book(karamazov)
mks_lib.add_book(feynman)
mks_lib.add_book(finnegan)
mks_lib.add_book(k_and_r)
puts "-------------------------"

puts "Listing all five books in the mks_lib's catalog with their status:"
mks_lib.list_books
puts "-------------------------"

puts "Checking out two books for mike"
mks_lib.check_out(mike, stranger)
mks_lib.check_out(mike, nausea)
puts "-------------------------"

puts "Checking out two books for gilbert"
mks_lib.check_out(gilbert, karamazov)
mks_lib.check_out(gilbert, feynman)
puts "-------------------------"

puts "Listing all five books in the mks_lib's catalog with their statuses:"
mks_lib.list_books
puts "-------------------------"

puts "Attempting to check out another book for Mike:"
puts "(This should fail since he already has two checked out)"
mks_lib.check_out(mike, finnegan)
puts "-------------------------"

puts "The book finnegan should still be available:"
mks_lib.check_out(ricardo, finnegan)
puts "-------------------------"

puts "But book finnegan should fail since it is already checked out:"
mks_lib.check_out(ricardo, stranger)
puts "-------------------------"

puts "These should return the books each user checked out:"
puts ''
puts "Mike:"
mike.borrowed_books_list
puts ''
puts "Gilbert:"
gilbert.borrowed_books_list
puts ''
puts "Ricardo:"
ricardo.borrowed_books_list
puts "-------------------------"

puts "This should only show the borrowed books with their borrowers:"
mks_lib.borrowed_books
puts "-------------------------"

puts "This should only show the available books:"
mks_lib.available_books
puts "-------------------------"
