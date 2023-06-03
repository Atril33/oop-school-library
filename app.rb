require './book'
require './person'
require './teacher'
require './student'
require './rental'

class App
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def new_student
    print 'Enter Student Name:'
    name = gets.chomp
    print 'Enter Student Age:'
    age = gets.chomp

    print 'Parent permission? [Y/N]'
    permission = gets.chomp
    permission = true if %w[Y y].include?(permission)
    permission = false if %w[N n].include?(permission)

    student = Student.new(age, nil, name: name, parent_permission: permission)
    @people.push(student)
    print 'Student Created Successfully'
  end

  def new_teacher
    print 'Enter Teacher Name:'
    name = gets.chomp
    print 'Enter Teacher Age:'
    age = gets.chomp
    print 'Enter specialization:'
    specialization = gets.chomp

    teacher = Teacher.new(age, specialization, name: name)
    @people.push(teacher)
    print 'Teacher Created Successfully'
  end

  def new_person
    print 'Do you want to create a student (1) or a teacher (2)?'
    select_number = gets.chomp.to_i

    if select_number == 1
      new_student
    elsif select_number == 2
      new_teacher
    end
  end

  def all_books
    @books.each { |book| puts "Title: #{book.title}, By Author: #{book.author}" }
  end

  def all_people
    @people.each { |person| puts "ID: #{person.id}, Name: #{person.name}, Age: #{person.age}" }
  end

  def new_book
    print 'Enter Book Title:'
    title = gets.chomp
    print 'Enter Book Author:'
    author = gets.chomp

    book = Book.new(title, author)
    @books.push(book)
    print 'Book created successfully'
  end

  def new_rental
    print 'Select a book from the following list by number'
    @books.each_with_index do |book, index|
    puts "#{index}) Title: #{book.title}, Author: #{book.author}"
 end

    book_index = gets.chomp.to_i

    print 'Select a person from the following list by number (not ID)'

    @people.each_with_index do |person, index|
    puts "#{index}) Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
  end

    person_index = gets.chomp.to

    print 'Enter Date: '
    date = gets.chomp

    @rentals << Rental.new(@books[book_index], @people[person_index], date)
    print 'Rental created successfully'
  end

  def all_rentals
    print 'Enter a person ID:'
    person_id = gets.chomp.to

    person = @people.find { |item| item.id == person_id }
    rentals = @rentals.select { |rental| rental.person == person }
    rentals.each { |ren| puts "Book: #{ren.book.title}, Date: #{ren.date}" }
  end
end
