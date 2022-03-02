# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts " deleting all services"
Service.destroy_all
puts "service clean"
puts "creating services"

service1 = Service.new(name: "Pôle emploi", description: "Ne soyez jamais en retard dans vos taches administratives", color: "20447B")
service2 = Service.new(name: "Impots", description: "Ne manquez pas vos RDV fiscaux!", color: "004B6C")
service3 = Service.new(name: "CAF", description: "Un papier? Une attestation, on vous dit tout", color: "73AFD0")

service1.save!
service2.save!
service3.save!

puts "#{Service.count} have been created!"
