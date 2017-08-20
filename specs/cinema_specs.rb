require("pry-byebug")
require("minitest/autorun")
require("minitest/rg")
require_relative("../db/sql_runner.rb")
require_relative("../models/customer.rb")
require_relative("../models/ticket.rb")
require_relative("../models/film.rb")


class CinemaTest < Minitest::Test


  def test_buying_function__fail
    film = Film.new({"title" => "Dunkirk", "price" => 20})
    customer = Customer.new({"name" => "Harry Hopopotamus", "funds" => 5})
    assert_equal("Sorry, your card was declined.", customer.buy_ticket(film))
  end

  def test_buy_function__pass
    customer1 = Customer.new({"name" => "Dr Worm", "funds" => 1_000})
    film1 = Film.new({"title" => "Atomic Blonde", "price" => 15})
    customer1.buy_ticket(film1)
    assert_equal(985, customer1.funds)
  end
end
