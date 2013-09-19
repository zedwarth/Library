class Book
  attr_reader :title, :author
  attr_accessor :due_date, :library, :user, :reported_lost

  def initialize(title, author, description = nil)
    @title       = title
    @author      = author
    @description = description
  end

  # Returns true if a book is overdue, false otherwise.
  def overdue?
    Time.now > @due_date
  end

  # Returns true if a book is available, false otherwise.
  def available?
    status == :available
  end

  # Returns the Symbol status of the book.
  def status
    return :available if @library.books.include?(self)
    return :lost      if (@due_date < (Time.now - (60*60*24*365))) || @reported_lost
    return :overdue   if overdue?
    return :checked_out
  end
end