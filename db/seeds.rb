# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Review.delete_all
Product.delete_all
Category.delete_all
User.delete_all

array = ['angelina.jpg', 'dicaprio.jpg', 'eva.jpg',
         'justin.jpg', 'monica.jpg', 'obama.jpg', 'penelope.jpg', 'peter.jpg']
pass = 'password123'

user1 = User.create(email: 'user1@example.com', password: pass,
      password_confirmation: pass, firstname: FFaker::Name.first_name,
      lastname: FFaker::Name.last_name, avatar: array.sample)

user2 = User.create(email: 'user2@example.com', password: pass,
      password_confirmation: pass, firstname: FFaker::Name.first_name,
      lastname: FFaker::Name.last_name, avatar: array.sample)

user3 = User.create(email: 'user3@example.com', password: pass,
      password_confirmation: pass, firstname: FFaker::Name.first_name,
      lastname: FFaker::Name.last_name, avatar: array.sample)

user4 = User.create(email: 'user4@example.com', password: pass,
      password_confirmation: pass, firstname: FFaker::Name.first_name,
      lastname: FFaker::Name.last_name, avatar: array.sample)

user5 = User.create(email: 'user5@example.com', password: pass,
      password_confirmation: pass, firstname: FFaker::Name.first_name,
      lastname: FFaker::Name.last_name, avatar: array.sample)

admin = User.create(email: 'admin@example.com', password: pass,
      password_confirmation: pass, firstname: FFaker::Name.first_name,
      lastname: FFaker::Name.last_name, avatar: array.sample, admin: true)

#############################################

category = Category.create(name: 'AGD & RTV DEVICES')

product1 = category.products.create(user_id: user1.id,
       title: 'Microwave', description: FFaker::Lorem.paragraph(3),
       price: rand(1..50) )

product2 = category.products.create(user_id: user2.id,
        title: 'Laptop', description: FFaker::Lorem.paragraph(3),
        price: rand(1..50) )

product3 = category.products.create(user_id: user3.id,
        title: 'Dishwasher', description: FFaker::Lorem.paragraph(3),
        price: rand(1..50) )

product4 = category.products.create(user_id: user4.id,
        title: 'Washing machine', description: FFaker::Lorem.paragraph(3),
        price: rand(1..50) )

product5 = category.products.create(user_id: user5.id,
        title: 'Wireless mouse', description: FFaker::Lorem.paragraph(3),
        price: rand(1..50) )

product6 = category.products.create(user_id: admin.id,
        title: 'Monitor', description: FFaker::Lorem.paragraph(3),
        price: rand(1..50) )

User.all.each do |u|
      Review.create(product_id: product1.id, user_id: u.id,
                content: FFaker::Lorem.paragraph(3), rating: rand(1..5))
      Review.create(product_id: product2.id, user_id: u.id,
                content: FFaker::Lorem.paragraph(3), rating: rand(1..5))
      Review.create(product_id: product3.id, user_id: u.id,
                content: FFaker::Lorem.paragraph(3), rating: rand(1..5))
      Review.create(product_id: product4.id, user_id: u.id,
                content: FFaker::Lorem.paragraph(3), rating: rand(1..5))
      Review.create(product_id: product5.id, user_id: u.id,
                content: FFaker::Lorem.paragraph(3), rating: rand(1..5))
end