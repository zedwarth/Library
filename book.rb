class Book
  attr_reader :title, :author
  attr_accessor :due_date

  def initialize(title, author, description = nil)
    @title       = title
    @author      = author
    @description = description
  end

  # Returns true if a book is overdue, false otherwise.
  def overdue?
    Time.now > @due_date
  end
end