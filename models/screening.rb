require("pry-byebug")
require_relative("film.rb")
require_relative("ticket.rb")
require_relative("customer.rb")
require_relative("../db/sql_runner.rb")

class Screening

  attr_accessor(:film_id, :tickets_bought, :start_time)
  attr_reader(:id)

  def initialize(screening_details)
    @id = screening_details["id"].to_i if screening_details["id"]
    @film_id = screening_details["film_id"]
    @tickets_bought = screening_details["tickets_bought"]
    @start_time = screening_details["start_time"]
    @price = screening_details["price"]
  end

  def save()
    sql = "
     INSERT INTO screenings (film_id, tickets_bought, start_time)
     VALUES ($1, $2, $3, $4) RETURNING id;
     "
     values = [@film_id, @tickets_bought, @start_time, @price]
     result = SqlRunner.run(sql, values)
     @id = result[0]["id"].to_i
  end

  def Screening.delete_all()
    sql = "DELETE FROM screenings;"
    SqlRunner.run(sql, [])
  end

  def Screening.all()
    sql = "SELECT * FROM screenings;"
    result = SqlRunner.run(sql, [])
    return Screenings.map_items(result)
  end

  def Screening.map_items(result)
    return result.map() {|row| Screening.new(row)}
  end

  def update()
    sql = "UPDATE screenings SET (film_id, tickets_bought, start_time)
    = ($1, $2, $3, $4) WHERE id = $5;"
    values = [@film_id, @tickets_bought, @start_time, @price, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = " DELETE FROM screenings WHERE id = $1"
    SqlRunner.run(sql, [@id])
  end



end
