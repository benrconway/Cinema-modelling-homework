require_relative("../db/sql_runner.rb")
require("pry-byebug")

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

  def delete()
    sql = "DELETE FROM customers WHERE id = $1"
    SqlRunner.run(sql, [@id])
  end

  def save()
    sql = "INSERT INTO customers (name, funds)
      VALUES ($1, $2) RETURNING id;
    "
    result = SqlRunner.run(sql,[@name, @funds])
    @id = result[0]["id"].to_i
  end

  def Customer.all()
    sql = "SELECT * FROM customers;"
    result = SqlRunner.run(sql, [])
    customers = Customer.map_items(result)
  end

  def Customer.map_items(result)
    return result.map() {|row| Customer.new(row)}
  end

  def update()
    sql = " UPDATE customers SET (name, funds)
      = ($1, $2) WHERE id = $3;
    "
    SqlRunner.run(sql, [@name, @funds, @id])
  end

  def films()
    sql = "SELECT films.* FROM films INNER JOIN tickets
      ON tickets.film_id = films.id WHERE customer_id = $1
    "
    result = SqlRunner.run(sql, [@id])
    return Film.map_items(result)
  end

  def ticket_count()
    sql = " SELECT * FROM tickets WHERE customer_id = $1"
    result = SqlRunner.run(sql, [@id])
    return Ticket.map_items(result).count()
  end

  def buy_ticket(screening)
    if @funds < screening.price
      return "Sorry, your card was declined."
    elsif screening.attendance >= 30
      return "Sorry, the screening is full."
    else
      @funds -= screening.price
      self.update()
      screening.attendance += 1
      screening.update()
    end
    return Ticket.new({"customer_id" => @id, "film_id" => screening.film_id })
  end


end
