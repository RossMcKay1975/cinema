require_relative('../models/ticket')
require_relative('../db/sql_runner')


class Film

  attr_reader :id
  attr_accessor :title, :price

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @price = options['price'].to_i
  end

  def save()
    sql = "INSERT INTO films (title, price) VALUES ($1, $2) RETURNING id"
    values = [@title, @price]
    film = SqlRunner.run(sql, values).first
    @id = film['id'].to_i
  end

  def self.delete_all
    sql = "DELETE FROM films"
    SqlRunner.run(sql)
  end

  # def update()
  #   sql = "UPDATE films SET (title, price) = ($1, $2) WHERE id = $3"
  #   values = [@title, @price, @id]
  #   SqlRunner.run(sql, values)
  # end

end

# def save()
  #   sql = "INSERT INTO movies (title, genre, budget) VALUES ($1, $2, $3) RETURNING id"
  #   values = [@title, @genre, @budget]
  #   movie = SqlRunner.run(sql, values).first
  #   @id = movie['id'].to_i
  # end

# def self.delete_all
#   sql = "DELETE FROM movies"
#   SqlRunner.run(sql)
# end