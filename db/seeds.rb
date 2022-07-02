# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(id: 1, email: 'mathieu.houde@codeboxx.biz', password: 'password123', password_confirmation: 'password123')
User.create(id: 2, email: 'patrick.thibault@codeboxx.biz', password: 'password123', password_confirmation: 'password123')
User.create(id: 3, email: 'francis.patry-jessop@codeboxx.biz', password: 'password123', password_confirmation: 'password123')
User.create(id: 4, email: 'david.amyot@codeboxx.biz', password: 'password123', password_confirmation: 'password123')
User.create(id: 5, email: 'marie-eve.goupil@codeboxx.biz', password: 'password123', password_confirmation: 'password123')
User.create(id: 6, email: 'francois.boivin@codeboxx.biz', password: 'password123', password_confirmation: 'password123')
User.create(id: 7, email: 'timothy.wever@codeboxx.biz', password: 'password123', password_confirmation: 'password123')
User.create(id: 8, email: 'kiril.kleinerman@codeboxx.biz', password: 'password123', password_confirmation: 'password123')
User.create(id: 9, email: 'felicia.hartono@codeboxx.biz', password: 'password123', password_confirmation: 'password123')
User.create(id: 10, email: 'eileen.ai@codeboxx.biz', password: 'password123', password_confirmation: 'password123')
    Employee.create(id: 1, first_name: "Mathieu", last_name: "Houde", title: "Gopher")
    Employee.create(id: 2, first_name: "Patrick", last_name: "Thibault", title: "Maximalist")
    Employee.create(id: 3, first_name: "Francis", last_name: "Patry-Jessop", title: "Captain")
    Employee.create(id: 4, first_name: "David", last_name: "Amyot", title: "The Man")
    Employee.create(id: 5, first_name: "Marie-Ève", last_name: "Goupil", title: "AI Master")
    Employee.create(id: 6, first_name: "François", last_name: "Boivin", title: "The Tank")
    Employee.create(id: 7, first_name: "Timothy", last_name: "Wever", title: "Beard whisperer")
    Employee.create(id: 8, first_name: "Kiril", last_name: "Kleinerman", title: "I <3 Winnipeg")
    Employee.create(id: 9, first_name: "Felicia", last_name: "Hartono", title: "Scrums are too early")
    Employee.create(id: 10, first_name: "Eileen", last_name: "Ai", title: "They really are.")

