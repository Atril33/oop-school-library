require './classes/app'

def main
  app = App.new

  loop do
    puts <<~MENU

      Welcome To School Library App
      ''
      Please Enter An Option by Entering a number
      1. List all books
      2. List all people
      3. Create a person
      4. Create a book
      5. Create a rental
      6. List all rentals for a given person ID
      7. Exit
    MENU

    select_one(app)
  end
end

def select_one(app)
  option = gets.chomp

  case option
  when '1'
    app.all_books
  when '2'
    app.all_people
  when '3'
    app.new_person
  when '4'
    app.new_book
  when '5'
    app.new_rental
  when '6'
    app.all_rentals
  else
    puts 'Thank you for using this app!'
    exit
  end
end

def exit_app
  puts 'Thank you for using this app!'
  exit
end

main
