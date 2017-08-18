require_relative("../db/sql_runner.rb")

class Customer

  def initialize(customer_info)
    @id = customer_info["id"] if customer_info["id"]
    @name = customer_info["name"]
    @funds = customer_info["funds"]
  end



end
