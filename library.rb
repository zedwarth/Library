class Book
	attr_reader :title, :author, :id, :status

	def initialize(title, author, id = nil)
		@title  = title
		@author = author
		@id = id 
		@status = "available"
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
	attr_reader :name

	def initialize(name)
		@name = name
	end
end

class Library
	attr_reader :books

	def initialize(name)
		@books = Array.new
		@ids = 0
	end

	def register_new_book(title, author)
		book = Book.new(title, author, @ids)
		@books << book
		@ids += 1
	end

	def check_out_book(book_id, borrower)

		#Find book by id
		book = @books.select { |book| book.id == book_id }[0]

		#Set book as checked out
		book.check_out
		book
		
	end

	def check_in_book(book)
	end

	def available_books
	end

	def borrowed_books
	end
end
