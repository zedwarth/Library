require_relative "library.rb"

puts "create our library"
mks_lib = Library.new("The MakerSquare Library")
puts "-------------------------"

puts "create our borrowers"
mike = Borrower.new("Mike")
ricardo = Borrower.new("Ricardo")
gilbert = Borrower.new("Gilbert")
puts "-------------------------"

puts "create our books"
stranger = Book.new("The Stranger", "Albert Camus")
nausea = Book.new("Nausea", "Jean-Paul Sartre")
karamazov = Book.new("The Brothers Karamazov", "Fyodor Dostoesvky")
feynman = Book.new("Surely You're Joking Mr. Feynman", "Richard Feynman")
finnegan = Book.new("Finnegans Wake", "James Joyce")
k_and_r = Book.new("The C Programming Language", "Kernighan and Ritchie")
puts "-------------------------"

puts "add our books to the library"
mks_lib.add_book(stranger)
mks_lib.add_book(nausea)
mks_lib.add_book(karamazov)
mks_lib.add_book(feynman)
mks_lib.add_book(finnegan)
mks_lib.add_book(k_and_r)
puts "-------------------------"

puts "list all five books in the mks_lib's catalog with their status:"
mks_lib.list_books
puts "-------------------------"

puts "check out two books for mike"
mks_lib.check_out(mike, stranger)
mks_lib.check_out(mike, nausea)
puts "-------------------------"

puts "check out two books for gilbert"
mks_lib.check_out(gilbert, karamazov)
mks_lib.check_out(gilbert, feynman)
puts "-------------------------"

puts "list all five books in the mks_lib's catalog with their statuses:"
mks_lib.list_books
puts "-------------------------"

puts "try to check out another book for Mike, this should fail since he already
  has two out"
mks_lib.check_out(mike, finnegan)
puts "-------------------------"

puts "this book should still be available since it failed before"
mks_lib.check_out(ricardo, finnegan)
puts "-------------------------"

puts "but this book should fail since it is already checked out"
mks_lib.check_out(ricardo, stranger)
puts "-------------------------"

puts "these should return the books each user checked out"
puts ''
puts "mike:"
mike.borrowed_books_list
puts ''
puts "gilbert:"
gilbert.borrowed_books_list
puts ''
puts "ricardo:"
ricardo.borrowed_books_list
puts "-------------------------"

puts "this should only show the borrowed books with their borrowers"
mks_lib.borrowed_books
puts "-------------------------"

puts "this should only show the available books"
mks_lib.available_books
puts "-------------------------"


