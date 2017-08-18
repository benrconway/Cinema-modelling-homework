require_relative("../db/sql_runner.rb")

class Film

  attr_reader(:id)
  attr_accessor(:title, :price)

  def initialize(film_info)
    @id = film_info["id"].to_i if film_info["id"]
    @title = film_info["title"]
    @price = film_info["price"]
  end

  def Film.delete_all()
    sql = "DELETE FROM films;"
    SqlRunner.run(sql, [])
  end

  def delete()
    sql = "DELETE FROM films WHERE id = $1"
    SqlRunner.run(sql, [@id])
  end

  def save()
    sql = "INSERT INTO films (title, price)
    VALUES ($1, $2) RETURNING id;
    "
    result = SqlRunner.run(sql, [@title, @price])
    @id = result[0]["id"].to_i
  end

  def Film.map_items(result)
    return result.map() {|row| Film.new(row)}
  end

  def Film.all()
    sql = "SELECT * FROM films;"
    result = SqlRunner.run(sql, [])
    return films = Film.map_items(result)
  end

  def update()
    sql = " UPDATE tickets SET (title, price)
    = ($1, $2) WHERE id = $3;
    "
    SqlRunner.run(sql, [@title, @price, @id])
  end

  def customers()
    sql = "SELECT customers.* FROM customers INNER JOIN tickets
      ON tickets.customer_id = customers.id WHERE film_id = $1
    "
    result = SqlRunner.run(sql, [@id])
    return Customer.map_items(result)
  end

end
