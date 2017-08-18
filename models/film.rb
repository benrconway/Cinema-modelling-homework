require_relative("../db/sql_runner.rb")

class Film

  def initialize(film_info)
    @id = film_info["id"] if film_info["id"]
    @title = film_info["title"]
    @price = film_info["price"]
  end
  

end
