# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "open-uri"

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

file1 = URI.open('https://upload.wikimedia.org/wikipedia/fr/thumb/c/c0/Logo_P%C3%B4le_Emploi_2008.svg/1280px-Logo_P%C3%B4le_Emploi_2008.svg.png')
file2 = URI.open('https://upload.wikimedia.org/wikipedia/fr/thumb/6/6d/Logo_DGFP-fr.svg/1280px-Logo_DGFP-fr.svg.png')
file3 = URI.open('https://upload.wikimedia.org/wikipedia/fr/thumb/c/cb/Caisse_d_allocations_familiales_france_logo.svg/1200px-Caisse_d_allocations_familiales_france_logo.svg.png')
file4 = URI.open('https://upload.wikimedia.org/wikipedia/fr/thumb/e/e8/Logo_Swiss_Life.svg/1200px-Logo_Swiss_Life.svg.png')
file5 = URI.open('https://upload.wikimedia.org/wikipedia/fr/2/2a/Logo-laposte.png')
file6 = URI.open('https://upload.wikimedia.org/wikipedia/commons/thumb/c/c7/Logo-Mairie.svg/2048px-Logo-Mairie.svg.png')
file7 = URI.open('https://www.femasif.fr/wp-content/uploads/sites/3/2019/02/cpam-logo-620x380.png')
file8 = URI.open('https://upload.wikimedia.org/wikipedia/fr/thumb/8/80/Logo_Hauts-de-France_2016.svg/1200px-Logo_Hauts-de-France_2016.svg.png')

service1 = Service.new(name: "Pôle Emploi", description: "Ne soyez jamais en retard dans vos taches administratives", color: "#20447B", private: false )
service2 = Service.new(name: "Impôts", description: "Ne manquez pas vos RDV fiscaux!", color: "#004B6C", private: false)
service3 = Service.new(name: "CAF", description: "Un papier? Une attestation, on vous dit tout", color: "#73AFD0", private: false)
service4 = Service.new(name: "Mutuelle", description: "Un remboursement à suivre? on vous le rappelle!", color: "#E50028", private: false)
service5 = Service.new(name: "La poste", description: "Un envoie important en attente? Venez, on vous aide à le suivre", color: "#FCD20B", private: false)
service6 = Service.new(name: "Mairie", description: "Un projet sympa? dites le nous!", color: "#0cadb7", private: false)
service7 = Service.new(name: "CPAM", description: "Suivez vos remboursements", color: "#163860", private: false)
service8 = Service.new(name: "la Region", description: "financez votre formation", color: "#ff9800", private: false)

service1.photo.attach(io: file1, filename: 'nes.png', content_type: 'image/png')
service2.photo.attach(io: file2, filename: 'nes.png', content_type: 'image/png')
service3.photo.attach(io: file3, filename: 'nes.png', content_type: 'image/png')
service4.photo.attach(io: file4, filename: 'nes.png', content_type: 'image/png')
service5.photo.attach(io: file5, filename: 'nes.png', content_type: 'image/png')
service6.photo.attach(io: file6, filename: 'nes.png', content_type: 'image/png')
service7.photo.attach(io: file7, filename: 'nes.png', content_type: 'image/png')
service8.photo.attach(io: file8, filename: 'nes.png', content_type: 'image/png')

service1.save!
service2.save!
service3.save!
service4.save!
service5.save!
service6.save!
service7.save!
service8.save!

puts "#{Service.count} have been created!"

puts "creating users"

user1 = User.create(first_name: "Thibault", last_name: "Danel", password: "azerty", email: "thibault@mail.com")
user2 = User.create(first_name: "Yassine", last_name: "Allaouna", password: "azerty", email: "yassine@mail.com")
user3 = User.create(first_name: "Hugo", last_name: "H", password: "azerty", email: "hugo@mail.com")

puts "#{User.count} have been created!"

puts "creating user-services"

# user_service1 = UserService.new(contact_email: "veronique@pole-emploi.fr", contact_phone: "03.20.11.22.33", contact_name: "Véronique Dubois", contact_address: "lille", service: service1, user: user1)
# user_service2 = UserService.new(contact_email: "Robert@finances.fr", contact_phone: "03.20.15.25.35", contact_name: "Robert Delsalle", contact_address: "lens", service: service2, user: user1)
# user_service3 = UserService.new(contact_email: "Hugo@caf.fr", contact_phone: "03.20.18.28.38", contact_name: "Hugo Delfion", contact_address: "saint Quentin", service: service3, user: user1)
# user_service4 = UserService.new(contact_email: "Manu@mairie.fr", contact_phone: "03.20.18.55.38", contact_name: "Manu Hot-Dog", contact_address: "Lille", service: service6, user: user1)
# user_service5 = UserService.new(contact_email: "veronique@pole-emploi.fr", contact_phone: "03.20.11.22.33", contact_name: "Véronique Dubois", contact_address: "lille", service: service1, user: user2)
# user_service6 = UserService.new(contact_email: "Robert@finances.fr", contact_phone: "03.20.15.25.35", contact_name: "Robert Delsalle", contact_address: "lens", service: service4, user: user2)
# user_service7 = UserService.new(contact_email: "Hugo@caf.fr", contact_phone: "03.20.18.28.38", contact_name: "Hugo Delfion", contact_address: "saint Quentin", service: service5, user: user2)
# user_service8 = UserService.new(contact_email: "veronique@pole-emploi.fr", contact_phone: "03.20.11.22.33", contact_name: "Véronique Dubois", contact_address: "lille", service: service1, user: user3)
# user_service9 = UserService.new(contact_email: "Robert@finances.fr", contact_phone: "03.20.15.25.35", contact_name: "Robert Delsalle", contact_address: "lens", service: service2, user: user3)
# user_service10 = UserService.new(contact_email: "Hugo@caf.fr", contact_phone: "03.20.18.28.38", contact_name: "Hugo Delfion", contact_address: "saint Quentin", service: service3, user: user3)
# user_service1.save!
# user_service2.save!
# user_service3.save!
# user_service4.save!
# user_service5.save!
# user_service6.save!
# user_service7.save!
# user_service8.save!
# user_service9.save!
# user_service10.save!

puts "#{UserService.count} have been created!"

puts "Creating Tasks"

# task1 = Task.new(user_service: user_service1, user: user1, title: 'envoyer attestation', description: 'urgent pour renouvelement de droits', end_date: Date.parse('2022-03-23'))
# task2 = Task.new(user_service: user_service2, user: user2, title: 'envoyer courrier', description: 'urgent pour renouvelement de droits', end_date: Date.parse('2022-03-25'))
# task3 = Task.new(user_service: user_service3, user: user3, title: 'inscription', description: 'urgent pour renouvelement de droits', end_date: Date.parse('2022-03-16'))
# task4 = Task.new(user_service: user_service1, user: user1, title: 'Appeller conseiller', description: 'urgent pour renouvelement de droits', end_date: Date.parse('2022-03-12'))
# task5 = Task.new(user_service: user_service2, user: user2, title: 'telephoner à la mairie', description: 'urgent pour renouvelement de droits', end_date: Date.parse('2022-03-11'))
# task6 = Task.new(user_service: user_service3, user: user3, title: 'renouvellement abonnement', description: 'urgent pour renouvelement de droits', end_date: Date.parse('2022-03-01'))
# task7 = Task.new(user_service: user_service1, user: user1, title: 'envoyer courrier', description: 'urgent pour renouvelement de droits', done: true, end_date: Date.parse('2022-03-30'))
# task8 = Task.new(user_service: user_service1, user: user1, title: 'envoyer attestation', description: 'urgent pour renouvelement de droits', end_date: Date.parse('2022-03-28'))
# task9 = Task.new(user_service: user_service2, user: user2, title: 'envoyer courrier', description: 'urgent pour renouvelement de droits', end_date: Date.parse('2022-03-27'))
# task10 = Task.new(user_service: user_service3, user: user1, title: 'inscription', description: 'urgent pour renouvelement de droits', done: true, end_date: Date.parse('2022-03-26'))
# task11 = Task.new(user_service: user_service1, user: user1, title: 'Appeller conseiller', description: 'urgent pour renouvelement de droits', done: true, end_date: Date.parse('2022-03-21'))
# task12 = Task.new(user_service: user_service2, user: user1, title: 'telephoner à la mairie', description: 'urgent pour renouvelement de droits', done:true, end_date: Date.parse('2022-03-10'))
# task13 = Task.new(user_service: user_service3, user: user1, title: 'renouvellement abonnement', description: 'urgent pour renouvelement de droits', done: true, end_date: Date.parse('2022-03-05'))
# task14 = Task.new(user_service: user_service1, user: user1, title: 'envoyer courrier', description: 'urgent pour renouvelement de droits', done: true, end_date: Date.parse('2022-03-22'))

# task1.save!
# task2.save!
# task3.save!
# task4.save!
# task5.save!
# task6.save!
# task7.save!
# task8.save!
# task9.save!
# task10.save!
# task11.save!
# task12.save!
# task13.save!
# task14.save!

# puts "#{Task.count} have been created!"
# p user_service1

service_task1 = ServiceTask.new(service: service1,  title: 'Actualistation', description: 'indispensable pour indemnités', offset_day: rand(1..15))
service_task2 = ServiceTask.new(service: service1,  title: 'Rdv conseiller', description: 'mettre à jour CV', offset_day: rand(1..15))
service_task3 = ServiceTask.new(service: service1,  title: 'Inscription formation', description: 'Urgent', offset_day: rand(1..15))
service_task4 = ServiceTask.new(service: service1,  title: 'Re-inscription', description: 'A ne pas oublier à la fin de la formation', offset_day: rand(1..15))
service_task5 = ServiceTask.new(service: service1,  title: 'envoyer attestation', description: 'urgent pour renouvelement de droits', offset_day: rand(1..15))

service_task6 = ServiceTask.new(service: service2,  title: 'Déclaration IR', description: 'Avant fin mai', offset_day: rand(1..15))
service_task7 = ServiceTask.new(service: service2,  title: 'Paiement IR', description: 'Avant fin Septembre', offset_day: rand(1..15))
service_task8 = ServiceTask.new(service: service2,  title: 'Taxe fonciere', description: 'Pas oublier avant fin Novembre', offset_day: rand(1..15))
service_task9 = ServiceTask.new(service: service2,  title: 'Verifier crédit impot', description: 'Verifier en Janvier et Juillet', offset_day: rand(1..15))

# service_task10 = ServiceTask.new(service: service3,  title: 'renouvellement abonnement', description: 'urgent pour renouvelement de droits', offset_day: 5)
# service_task11 = ServiceTask.new(service: service3,  title: 'envoyer courrier', description: 'urgent pour renouvelement de droits', offset_day: 5)
# service_task12 = ServiceTask.new(service: service3,  title: 'envoyer courrier', description: 'urgent pour renouvelement de droits', offset_day: 5)
# service_task13 = ServiceTask.new(service: service3,  title: 'inscription', description: 'urgent pour renouvelement de droits', offset_day: 5)

service_task14 = ServiceTask.new(service: service3,  title: 'Déclaration Ass-mat', description: '20 du mois', offset_day: rand(1..15))
service_task15 = ServiceTask.new(service: service3,  title: 'Déclarer un changement', description: 'urgent pour renouvelement de droits', offset_day: rand(1..15))
service_task16 = ServiceTask.new(service: service3,  title: 'Déclarer naissance', description: '3 mois avant naissance', offset_day: rand(1..15))
service_task17 = ServiceTask.new(service: service3,  title: 'Verifier paiement droit', description: '5 du mois', offset_day: rand(1..15))

service_task1.save!
service_task2.save!
service_task3.save!
service_task4.save!
service_task5.save!
service_task6.save!
service_task7.save!
service_task8.save!
service_task9.save!
# service_task10.save!
# service_task11.save!
# service_task12.save!
# service_task13.save!
service_task14.save!
service_task15.save!
service_task16.save!
service_task17.save!

puts "#{Task.count} have been created!"
puts "#{ServiceTask.count} have been created!"
