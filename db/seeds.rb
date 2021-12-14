# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


5.times do |i|
 order = Order.create(price: 100 * i, status: 'dispatched')
 order.update(created_at: order.created_at - i.day)
end

5.times do |i|
 order = Order.create(price: 100 * i, status: 'pending')
 order.update(created_at: order.created_at - i.day)
end

5.times do |i|
 order = Order.create(price: 100 * i, status: 'delivered')
 order.update(created_at: order.created_at - i.day)
end