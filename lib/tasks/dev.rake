namespace :dev do

  brands = ["Mercedes Benz", "Volkswagen", "Ford", "Scania", "Iveco",
          "Caterpillar", "Case", "New Holland", "Komatsu", "John Deere"]

  desc "Setup Development"
  task setup: :environment do

    images_path = Rails.root.join('public','system')

    puts "Executando o setup para desenvolvimento...\n\n"

    puts "APAGANDO BD... #{%x(rake db:drop)}"
    puts "APAGANDO...................................[OK]\n\n"

    puts "APAGANDO imagens de public/system... #{%x(rm -rf #{images_path})}"
    puts "APAGANDO...................................[OK]\n\n"

    puts "CRIANDO BD... #{%x(rake db:create)}"
    puts "CRIANDO....................................[OK]\n\n"

    puts %x(rake db:migrate)
    puts %x(rake db:seed)
    puts %x(rake dev:generate_admins)
    puts %x(rake dev:generate_members)
    puts %x(rake dev:generate_brands_and_models)
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

    puts "ADMINISTRADORES............................[OK]\n\n"
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

    puts "MEMBROS....................................[OK]\n\n"
end

desc "Cria Marcas e Modelos"
  task generate_brands_and_models: :environment do


  puts "Cadastrando MARCAS & MODELOS..."

    brands.each_with_index do |brand, i|
      10.times do
        Model.find_or_create_by(name: "M"+rand(1000..9999).to_s+"-"+i.to_s,
           brand: Brand.find_or_create_by(name: brand))
      end
    end

  puts "MARCAS & MODELOS...........................[OK]\n\n"
end

  desc "Cria Anúncios Fake"
  task generate_ads: :environment do
    puts "Cadastrando ANÚNCIOS..."

    brands.each_with_index do |brand, i|
      10.times do
        b = Brand.all.sample
        m = b.models.sample
        Ad.create!(
          brand: b,
          model: m,
          member: Member.all.sample,
          kind: i<=4 ? Kind.first : Kind.last,
          price: [0,rand(50000..200000)].sample,
          picture: File.new(Rails.root.join('public', 'templates', 'images-for-ads', "#{Random.rand(19)}.jpg"), 'r')
        )
       end
    end

    # 5.times do
    #   Ad.create!(
    #     brand: ["Mercedes Benz", "Volkswagen", "Ford", "Scania"].sample,
    #     model: "M"+rand(1000..9999).to_s,
    #     member: Member.all.sample,
    #     kind: Kind.first,
    #     price: "#{Random.rand(50000..200000)},#{Random.rand(99)}",
    #     picture: File.new(Rails.root.join('public', 'templates', 'images-for-ads', "#{Random.rand(19)}.jpg"), 'r')
    #   )
    # end

    puts "ANÚNCIOS...................................[OK]\n\n"
  end

end
