require_relative('models/ticket')
require_relative('models/customer')
require_relative('models/film')

require('pry-byebug')

# Ticket.delete_all
# Customer.delete_all
# Ticket.delete_all
#

customer1 = Customer.new({'name' => 'Mickey Mouse', 'funds' => 20})
customer2 = Customer.new({'name' => 'Donald Duck', 'funds' => 15})
customer1.save()
customer2.save()



film1 = Film.new({'title' => 'Die Hard', 'price' => 14})
film2 = Film.new({'title' => 'Exorcist', 'price'=> 14})
film1.save()
film2.save()

ticket1 = Ticket.new({'customer_id' => customer1.id, 'film_id' => film1.id})
ticket2 = Ticket.new({'customer-id' => customer2.id, 'film_id' => film1.id})
ticket1.save()
ticket2.save()

binding.pry
nil
