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
	end

	def add_book(title, author)
	end

	def check_out_book(book_id, borrower)
	end

	def check_in_book(book)
	end

	def available_books
	end

	def borrowed_books
	end
end
