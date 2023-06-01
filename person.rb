require './nameable'

class Person < Nameable
  attr_reader :id
  attr_accessor :name, :age, :rentals

  def initialize(age, parent_permission: true, name: 'Unknown')
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  private

  def of_age?
    return true if @age >= 18

    false
  end

  public

  def can_use_services?
    return true if @age || parent_permission == true

    false
  end

  def correct_name
    @name
  end

  def rent_book(book, date)
    rental = Rental.new(self, book, date)
    book.add_rental(rental)
  end

  def add_rental(book, date)
    Rental.new(date, book, self)
  end
end
