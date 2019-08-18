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
  #
  def self.delete_all
    sql = "DELETE FROM tickets"
    SqlRunner.run(sql)
  end
  #
  # def update()
  #   sql = "UPDATE customers SET (customer_id, film_id) = ($1, $2) WHERE id = $3"
  #   values = [@customer_id, @film_id, @id]
  #   SqlRunner.run(sql, values)
  # end
  #

end

  #
  # def save()
  #   sql = "INSERT INTO castings (movie_id, star_id, fee) VALUES ($1, $2, $3) RETURNING id"
  #   values = [@movie_id, @star_id, @fee]
  #   casting = SqlRunner.run(sql, values)[0];
  #   @id = casting['id'].to_i
  # end
