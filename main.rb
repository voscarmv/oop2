require_relative "./book.rb"
require_relative "./person.rb"
require_relative "./student.rb"
require_relative "./teacher.rb"
class App
    def initialize
        @books = []
        @people = []
        @rentals = []
    end
    
    def all_books
      if @books.length > 0 
        @books.each { |book| puts "title: #{book.title}, Author: #{book.author}" }   
      else
          puts "There are no books at the moment"
      end
    end

    def all_people
        # Lists all people
    end

    def create_person
        puts "Do you want to create a student (1) or a teacher (2)?"
        print "Select (1) or (2)"
        print " "
        selection = gets.chomp

        if (selection === "1") 
            print "Age: "
            age = gets.chomp

            print "Name: "
            name = gets.chomp

            ispermitted = false
            print "Has parent permission? [Y/N]: "
            permission = gets.chomp
            permission = permission.downcase == "y"
            if permission === 'y' 
             ispermitted = true
            else
                ispermitted = false
            end
            
    
            @people << Student.new(age, name, ispermitted)

            puts "student created successfully"
        elsif (selection === "2")
            print "Age: "
            age = gets.chomp

            print "Name: "
            name = gets.chomp

            print "Specialization: "
            specialization = gets.chomp
            @people << Teacher.new(age, specialization, name)

            puts "Teacher created successfully"

        else
            puts "invalid selection"

            return
        end
    end

    def create_book
        print "Title: "
        title = gets.chomp
    
        print "Author: "
        author = gets.chomp
    
        @books << Book.new(title, author)
        puts "Book created successfully"
    end

    def create_rental
    #   Creates a rental
    end

    def list_rentals
        # lists the rentals
    end
end

def main
    app = App.new()
    selection = nil

    while selection != "7"
        puts "Please choose an option by enterin a number:"
        puts "1 - List all books"
        puts "2 - List all people"
        puts "3 - Create a person"
        puts "4 - Create a book"
        puts "5 - Create a rental"
        puts "6 - List all rentals for a given person id"
        puts "7 - Exit"
        print "Add your selection"
        print " "
        selection = gets.chomp
    
        case selection
        when "1"
          app.all_books()
        when "2"
          app.all_people()
        when "3"
          app.create_person()
        when "4"
          app.create_book()
        when "5"
          app.create_rental()
        when "6"
          app.list_rentals()
        when "7"
          puts "Thank you for using this app!"
        end
        puts "\n"
      end
end
main()