require("pry")
require_relative("../models/customer.rb")
require_relative("../models/film.rb")
require_relative("../models/ticket.rb")

Customer.delete_all


customer1 = Customer.new({"name" => "Dr Worm", "funds" => 1_000})
customer2 = Customer.new({"name" => "Leon the Lion", "funds" => 100})
customer3 = Customer.new({"name" => "Gerry Giraffe", "funds" => 800})
customer4 = Customer.new({"name" => "Harry Hopopotamus", "funds" => 5})

film1 = Film.new({"title" => "Atomic Blonde", "price" => 15})
film2 = Film.new({"title" => "Dunkirk", "price" => 20})
film3 = Film.new({"title" => "The Dark Tower", "price" => 10})
film3 = Film.new({"title" => "The Hitman's Bodyguard", "price" => 15})

ticket1 = Ticket.new({"customer_id" => 3, "film_id" => 4})
ticket2 = Ticket.new({"customer_id" => 1, "film_id" => 1})
ticket3 = Ticket.new({"customer_id" => 2, "film_id" => 3})
ticket4 = Ticket.new({"customer_id" => 3, "film_id" => 3})
ticket5 = Ticket.new({"customer_id" => 1, "film_id" => 3})
ticket6 = Ticket.new({"customer_id" => 1, "film_id" => 2})
ticket7 = Ticket.new({"customer_id" => 1, "film_id" => 4})

customer1.save
customer2.save
customer3.save
customer4.save

binding.pry
nil
