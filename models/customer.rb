require_relative("../db/sql_runner.rb")
require("pry")

class Customer

  attr_reader(:id)
  attr_accessor(:name, :funds)

  def initialize(customer_info)
    @id = customer_info["id"].to_i if customer_info["id"]
    @name = customer_info["name"]
    @funds = customer_info["funds"]
  end

  def Customer.delete_all()
    sql = "DELETE FROM customers;"
    SqlRunner.run(sql, [])
  end

  def save()
    sql = "INSERT INTO customers (name, funds)
    VALUES ($1, $2) RETURNING id;
    "
    result = SqlRunner.run(sql,[@name, @funds])
    @id = result[0]["id"].to_i
  end

end
