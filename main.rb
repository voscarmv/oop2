class App
    def initialize
        @books = []
        @people = []
        @rentals = []
    end
    
    def all_books
        # Lists all books
    end

    def all_people
        # Lists all people
    end

    def create_person
        # creates a person
    end

    def create_book
        # creates a book
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

    unless selection === "7"
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