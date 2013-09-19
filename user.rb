class User
  attr_accessor :books, :name

  def initialize(name)
    @name  = name
    @books = []
  end
end