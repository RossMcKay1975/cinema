require_relative("../db/sql_runner")
require_relative("../models/film")

class Ticket

attr_reader :id
attr_accessor :film_id, :customer_id

def initialize(options)
  @id = options['id'].to_i if options['id']
  @customer_id = options['customer_id'].to_i
  @film_id = options['film_id'].to_i

end

  def save()
    sql = "INSERT INTO tickets (customer_id, film_id) VALUES ($1, $2) RETURNING id"
    values = [@customer_id, @film_id]
    ticket = SqlRunner.run(sql, values)[0]
    @id = ticket['id'].to_i
  end
  
  def self.delete_all
    sql = "DELETE FROM tickets"
    SqlRunner.run(sql)
  end

end
