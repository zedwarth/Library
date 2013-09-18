class Book
  attr_reader :title, :author
  attr_accessor :due_date, :user

  def initialize(title, author, description = nil)
    @title       = title
    @author      = author
    @description = description
  end
end