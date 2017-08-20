require("pry")
require_relative("../models/customer.rb")
require_relative("../models/film.rb")
require_relative("../models/ticket.rb")
require_relative("../models/screening.rb")

Customer.delete_all()
Film.delete_all()
Ticket.delete_all()
Screening.delete_all()

customer1 = Customer.new({"name" => "Dr Worm", "funds" => 1_000})
customer2 = Customer.new({"name" => "Leon the Lion", "funds" => 100})
customer3 = Customer.new({"name" => "Gerry Giraffe", "funds" => 800})
customer4 = Customer.new({"name" => "Harry Hopopotamus", "funds" => 5})

film1 = Film.new({"title" => "Atomic Blonde"})
film2 = Film.new({"title" => "Dunkirk"})
film3 = Film.new({"title" => "The Dark Tower"})
film4 = Film.new({"title" => "The Hitman's Bodyguard"})

customer1.save()
customer2.save()
customer3.save()
customer4.save()

film1.save()
film2.save()
film3.save()
film4.save()

screening1 = Screening.new({"film_id"=>film1.id, "price" => 15, "start_time" => "15:50", "attendance"=> 0})
screening2 = Screening.new({"film_id"=>film2.id, "price" => 15, "start_time" => "09:50", "attendance"=> 0})
screening3 = Screening.new({"film_id"=>film3.id, "price" => 15, "start_time" => "12:50", "attendance"=> 0})
screening4 = Screening.new({"film_id"=>film4.id, "price" => 15, "start_time" => "18:50", "attendance"=> 0})
screening1.save()
screening2.save()
screening3.save()
screening4.save()

ticket1 = customer1.buy_ticket(screening1)
ticket2 = customer2.buy_ticket(screening2)
ticket3 = customer3.buy_ticket(screening1)

ticket1.save
ticket2.save
ticket3.save



binding.pry
nil

# ticket1 = Ticket.new({"customer_id" => customer3.id, "film_id" => film4.id})
# ticket2 = Ticket.new({"customer_id" => customer1.id, "film_id" => film1.id})
# ticket3 = Ticket.new({"customer_id" => customer2.id, "film_id" => film3.id})
# ticket4 = Ticket.new({"customer_id" => customer3.id, "film_id" => film3.id})
# ticket5 = Ticket.new({"customer_id" => customer1.id, "film_id" => film3.id})
# ticket6 = Ticket.new({"customer_id" => customer1.id, "film_id" => film2.id})
# ticket7 = Ticket.new({"customer_id" => customer1.id, "film_id" => film4.id})

# ticket1.save()
# ticket2.save()
# ticket3.save()
# ticket4.save()
# ticket5.save()
# ticket6.save()
# ticket7.save()
