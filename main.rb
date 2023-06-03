require './app'

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
  if option == '1'
    app.all_books
  elsif option == '2'
    app.all_people
  elsif option == '3'
    app.new_person
  elsif option == '4'
    app.new_book
  elsif option == '5'
    app.new_rental
  elsif option == '6'
    app.all_rentals
  else
    exit_app
  end
end

def exit_app
  puts 'Thank you for using this app!'
  exit
end

main
