class User
  attr_accessor :books

  def initialize(name)
    @name  = name
    @books = []
  end
end