require("pg")
require_relative("../models/customer.rb")
require_relative("../models/film.rb")
require_relative("../models/ticket.rb")

class SqlRunner()

  def SqlRunner.run(sql, values)
    begin
      db = PG.connect({dbname:"cinema", host:"localhost"})
      db.prepare("query", sql)
      result = db.exec_prepared("query", values)
    ensure
    db.close
  end
  return result
  end

end
