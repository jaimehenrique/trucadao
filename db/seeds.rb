# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#  Mayor.create(name: 'Emanuel', city: cities.first)

puts "Cadastrando TIPOS..."

  Kind.find_or_create_by(description: "Caminhões")
  Kind.find_or_create_by(description: "Máquinas")

puts "TIPOS......................................[OK]"

puts "Cadastrando ADMINISTRADOR Padrão..."

Admin.create!(email: "admin@admin.com",
              name: "Administrador Geral",
              password: "123456",
              password_confirmation: "123456",
              role: 0
             )

puts "ADMINISTRADOR..............................[OK]"

puts "Cadastrando MEMBRO Padrão..."

Member.create!(
  email: "membro@membro.com",
  password: "123456",
  password_confirmation: "123456"
)

puts "MEMBRO.....................................[OK]"
