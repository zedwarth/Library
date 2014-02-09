class Book
	attr_accessor :id, :rating
	attr_reader :title, :author, :status, :year_published, :edition

	def initialize(title, author, year_published = nil, edition = nil)
		@title  = title
		@author = author
		@year_published = year_published
		@edition = edition
		@id = id 
		@status = "available"
		@rating = Array.new
	end

	def check_out
		if @status == "available"
			@status = "checked_out" 
			true
		else
			@status
			false
		end
	end

	def check_in
		if @status == "checked_out"
			@status = "available"
			true
		else
			@status
			false
		end
	end

end

class Borrower
	attr_accessor :checked_out
	attr_reader :name 

	def initialize(name)
		@name = name
		@checked_out = 0
	end

	def rate_book(book, rating, review="")
		unless review.empty?
			book.rating << [@name, rating, review]
		else
			book.rating << [@name, rating]
		end
	end
end

class Library
	attr_reader :books 

	def initialize(name)
		@books = Array.new
		@ids = 0
		@borrowed = Hash.new
		@borrower = Array.new
	end

	def register_new_book(title, author)
		book = Book.new(title, author)
		book.id = @ids
		@books << book
		@ids += 1
	end

	def book_by_id(book_id)
		@books.select { |book| book.id == book_id }[0]
	end

	def check_out_book(book_id, borrower)

		#Find book by id
		book = book_by_id(book_id)

		#If book hasn't been borrowed
		#Set book as checked out
		if book.check_out && borrower.checked_out < 2
			@borrowed[book_id] = borrower
			borrower.checked_out +=1
			book
		else
			nil
		end
		
	end

	def get_borrower(book_id)
		@borrowed[book_id].name
	end

	def check_in_book(book)
		@borrowed[book.id].checked_out -=1
		book.check_in
	end

	def available_books
		@books.select { |x| x.status == "available" }
	end

	def borrowed_books
		@books.select { |x| x.status == "checked_out" }
	end
end
