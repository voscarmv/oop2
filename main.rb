# rubocop:disable Metrics/MethodLength
# rubocop:disable Metrics/CyclomaticComplexity
require_relative './book'
require_relative './person'
require_relative './student'
require_relative './teacher'
class App
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def prompt(message)
    print message
    gets.chomp
  end

  def all_books
    if @books.length.positive?
      @books.each { |book| puts "title: #{book.title}, Author: #{book.author}" }
    else
      puts 'There are no books at the moment'
    end
  end

  def all_people
    if @books.length.positive?
      @people.each do |person|
        puts "Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
    else
      puts 'There are no people created'
    end
  end

  def create_person
    puts 'Do you want to create a student (1) or a teacher (2)?'
    print 'Select (1) or (2)'
    print ' '
    selection = gets.chomp

    case selection
    when '1'
      age = prompt('Age: ')
      name = prompt('Name :')

      print 'Has parent permission? [Y/N]: '
      permission = gets.chomp
      permission = permission.downcase == 'y'

      @people << Student.new(age, name, permission)

      puts 'student created successfully'
    when '2'
      age = prompt('Age: ')
      name = prompt('Name: ')
      specialization = prompt('Specialization: ')
      @people << Teacher.new(age, specialization, name)

      puts 'Teacher created successfully'

    else
      puts 'invalid selection'

      nil
    end
  end

  def create_book
    title = prompt('Title: ')
    author = prompt('Author: ')

    @books << Book.new(title, author)
    puts 'Book created successfully'
  end

  def create_rental
    puts 'Select a book from the following list by number'
    @books.each_with_index do |book, index|
      puts "#{index}) Title: \"#{book.title}\", Author: #{book.author}"
    end
    book_index = gets.chomp.to_i

    puts "\nSelect a person from the following list by number (not id)"
    @people.each_with_index do |person, index|
      puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    person_index = gets.chomp.to_i

    print "\nDate: "
    date = gets.chomp

    @rentals << Rental.new(date, @books[book_index], @people[person_index])
    puts 'Rental created successfully'
  end

  def list_rentals
    print 'ID of person: '
    id = gets.chomp.to_i

    rentals = @rentals.filter { |rental| rental.person.id == id }
    puts 'Rentals:'
    rentals.each do |rental|
      puts "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}"
    end
  end
end

def main
  app = App.new
  selection = nil

  while selection != '7'
    print 'Please choose an option by enterin a number:\n'\
          '1 - List all books\n'\
          '2 - List all people\n'\
          '3 - Create a person\n'\
          '4 - Create a book\n'\
          '5 - Create a rental\n'\
          '6 - List all rentals for a given person id\n'\
          '7 - Exit\n'\
          'Add your selection\n'\
          ' '
    selection = gets.chomp

    case selection
    when '1'
      app.all_books
    when '2'
      app.all_people
    when '3'
      app.create_person
    when '4'
      app.create_book
    when '5'
      app.create_rental
    when '6'
      app.list_rentals
    when '7'
      puts 'Thank you for using this app!'
    end
    puts "\n"
  end
end
main
# rubocop: enable Metrics/MethodLength
# rubocop: enable Metrics/CyclomaticComplexity
