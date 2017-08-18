require_relative("../db/sql_runner.rb")

class Ticket

  attr_reader(:id)
  attr_accessor(:customer_id, :film_id)

  def initialize(ticket_info)
    @id = ticket_info["id"].to_i if ticket_info["id"]
    @customer_id = ticket_info["customer_id"]
    @film_id = ticket_info["film_id"]
  end

  def Ticket.delete_all()
    sql = "DELETE FROM tickets;"
    SqlRunner.run(sql, [])
  end

  def save()
    sql = "INSERT INTO tickets (customer_id, film_id)
    VALUES ($1, $2) RETURNING id;
    "
    result = SqlRunner.run(sql, [@customer_id, @film_id])
    @id = result[0]["id"].to_i
  end

  def Ticket.map_items(result)
    return result.map() {|row| Ticket.new(row)}
  end

  def Ticket.all()
    sql = "SELECT * FROM tickets;"
    result = SqlRunner.run(sql, [])
    return tickets = ticket.map_items(result)
  end


end
