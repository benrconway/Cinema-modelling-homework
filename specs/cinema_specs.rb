require("pry-byebug")
require("minitest/autorun")
require("minitest/rg")
require_relative("../db/sql_runner.rb")
require_relative("../models/customer.rb")
require_relative("../models/ticket.rb")
require_relative("../models/film.rb")
require_relative("../models/screening.rb")


class CinemaTest < Minitest::Test


  def test_buying_function__fail
    screening = Screening.new({"id" => 1, "film_id"=>1, "price" => 15, "start_time" => "15:50", "attendance"=> 2})
    customer = Customer.new({"name" => "Harry Hopopotamus", "funds" => 5})
    assert_equal("Sorry, your card was declined.", customer.buy_ticket(screening))
  end

  def test_buy_function__pass
    customer1 = Customer.new({"name" => "Dr Worm", "funds" => 1_000})
    screening = Screening.new({"id" => 1, "film_id"=>1, "price" => 15, "start_time" => "15:50", "attendance"=> 2})
    customer1.buy_ticket(screening)
    assert_equal(985, customer1.funds)
  end
end
