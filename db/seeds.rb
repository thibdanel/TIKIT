# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts " deleting all tasks"
Task.destroy_all
puts "Task clean"

puts " deleting all user_services"
UserService.destroy_all
puts "user_service clean"

puts " deleting all Users"
User.destroy_all
puts "user clean"

puts " deleting all services"
Service.destroy_all
puts "service clean"

puts "creating services"

service1 = Service.new(name: "Pôle-Emploi", description: "Ne soyez jamais en retard dans vos taches administratives", color: "#20447B")
service2 = Service.new(name: "Impôts", description: "Ne manquez pas vos RDV fiscaux!", color: "#004B6C")
service3 = Service.new(name: "CAF", description: "Un papier? Une attestation, on vous dit tout", color: "#73AFD0")
service4 = Service.new(name: "Mutuelle", description: "Un remboursement à suivre? on vous le rappelle!", color: "#E50028")
service5 = Service.new(name: "La poste", description: "Un envoie important en attente? Venez, on vous aide à le suivre", color: "#FCD20B")

service1.save!
service2.save!
service3.save!
service4.save!
service5.save!

puts "#{Service.count} have been created!"

puts "creating users"

user1 = User.create(first_name: "Thibault", last_name: "Danel", password: "azerty", email: "thibault@mail.com")
user2 = User.create(first_name: "Yassine", last_name: "Allaouna", password: "azerty", email: "yassine@mail.com")
user3 = User.create(first_name: "Hugo", last_name: "H", password: "azerty", email: "hugo@mail.com")

puts "#{User.count} have been created!"

puts "creating user-services"

user_service1 = UserService.new(contact_email: "veronique@pole-emploi.fr", contact_phone: "03.20.11.22.33", contact_name: "Véronique Dubois", contact_address: "lille", service: service1, user: user1)
user_service2 = UserService.new(contact_email: "Robert@finances.fr", contact_phone: "03.20.15.25.35", contact_name: "Robert Delsalle", contact_address: "lens", service: service2, user: user1)
user_service3 = UserService.new(contact_email: "Hugo@caf.fr", contact_phone: "03.20.18.28.38", contact_name: "Hugo Delfion", contact_address: "saint Quentin", service: service3, user: user1)
user_service4 = UserService.new(contact_email: "veronique@pole-emploi.fr", contact_phone: "03.20.11.22.33", contact_name: "Véronique Dubois", contact_address: "lille", service: service1, user: user2)
user_service5 = UserService.new(contact_email: "Robert@finances.fr", contact_phone: "03.20.15.25.35", contact_name: "Robert Delsalle", contact_address: "lens", service: service2, user: user2)
user_service6 = UserService.new(contact_email: "Hugo@caf.fr", contact_phone: "03.20.18.28.38", contact_name: "Hugo Delfion", contact_address: "saint Quentin", service: service3, user: user2)
user_service7 = UserService.new(contact_email: "veronique@pole-emploi.fr", contact_phone: "03.20.11.22.33", contact_name: "Véronique Dubois", contact_address: "lille", service: service1, user: user3)
user_service8 = UserService.new(contact_email: "Robert@finances.fr", contact_phone: "03.20.15.25.35", contact_name: "Robert Delsalle", contact_address: "lens", service: service2, user: user3)
user_service9 = UserService.new(contact_email: "Hugo@caf.fr", contact_phone: "03.20.18.28.38", contact_name: "Hugo Delfion", contact_address: "saint Quentin", service: service3, user: user3)
user_service1.save!
user_service2.save!
user_service3.save!
user_service4.save!
user_service5.save!
user_service6.save!
user_service7.save!
user_service8.save!
user_service9.save!

puts "#{UserService.count} have been created!"

puts "Creating Tasks"

task1 = Task.new(user_service: user_service1, user: user1, title: 'envoyer attestation', description: 'urgent pour renouvelement de droits')
task2 = Task.new(user_service: user_service2, user: user2, title: 'envoyer courrier', description: 'urgent pour renouvelement de droits')
task3 = Task.new(user_service: user_service3, user: user3, title: 'inscription', description: 'urgent pour renouvelement de droits')
task4 = Task.new(user_service: user_service1, user: user1, title: 'Appeller conseiller', description: 'urgent pour renouvelement de droits')
task5 = Task.new(user_service: user_service2, user: user2, title: 'telephoner à la mairie', description: 'urgent pour renouvelement de droits')
task6 = Task.new(user_service: user_service3, user: user3, title: 'renouvellement abonnement', description: 'urgent pour renouvelement de droits')
task7 = Task.new(user_service: user_service1, user: user1, title: 'envoyer courrier', description: 'urgent pour renouvelement de droits', done: true)

task1.save!
task2.save!
task3.save!
task4.save!
task5.save!
task6.save!
task7.save!

puts "#{Task.count} have been created!"
