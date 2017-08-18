require_relative("../db/sql_runner.rb")

class Ticket

  def initialize(ticket_info)
    @id = ticket_info["id"] if ticket_info["id"]
    @customer_id = ticket_info["customer_id"]
    @film_id = ticket_info["film_id"]
  end

end
