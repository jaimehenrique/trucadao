namespace :dev do


  desc "Setup Development"
  task setup: :environment do

    images_path = Rails.root.join('public','system')

    puts "Executando o setup para desenvolvimento..."

    puts "APAGANDO BD... #{%x(rake db:drop)}"
    puts "APAGANDO...................................[OK]"

    puts "APAGANDO imagens de public/system... #{%x(rm -rf #{images_path})}"
    puts "APAGANDO...................................[OK]"

    puts "CRIANDO BD... #{%x(rake db:create)}"
    puts "CRIANDO....................................[OK]"

    puts %x(rake db:migrate)
    puts %x(rake db:seed)
    puts %x(rake dev:generate_admins)
    puts %x(rake dev:generate_members)
    puts %x(rake dev:generate_ads)

    puts "Setup realizado com sucesso!"
end

  desc "Cria Administradores Fake"
  task generate_admins: :environment do
    puts "Cadastrando ADMINISTRADORES..."

    5.times do
      Admin.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        password: "123456",
        password_confirmation: "123456",
        role: [0,1,1,1].sample
      )
    end

    puts "ADMINISTRADORES............................[OK]"
  end

desc "Cria Membros Fake"
  task generate_members: :environment do
    puts "Cadastrando MEMBROS..."

    10.times do
      Member.create!(
        email: Faker::Internet.email,
        password: "123456",
        password_confirmation: "123456"
      )
    end

    puts "MEMBROS....................................[OK]"
end

  desc "Cria Anúncios Fake"
  task generate_ads: :environment do
    puts "Cadastrando ANÚNCIOS..."

    5.times do
      Ad.create!(
        brand: ["Mercedes Benz", "Volkswagen", "Ford", "Scania"].sample,
        model: "M"+rand(1000..9999).to_s,
        member: Member.first,
        kind: Kind.all.sample,
        price: "#{Random.rand(50000..200000)},#{Random.rand(99)}",
        picture: File.new(Rails.root.join('public', 'templates', 'images-for-ads', "#{Random.rand(19)}.jpg"), 'r')
      )
    end

    50.times do
      Ad.create!(
        brand: ["Mercedes Benz", "Volkswagen", "Ford", "Scania"].sample,
        model: "M"+rand(1000..9999).to_s,
        member: Member.all.sample,
        kind: Kind.all.sample,
        price: "#{Random.rand(50000..200000)},#{Random.rand(99)}",
        picture: File.new(Rails.root.join('public', 'templates', 'images-for-ads', "#{Random.rand(19)}.jpg"), 'r')
      )
    end

    puts "ANÚNCIOS...................................[OK]"
  end

end
