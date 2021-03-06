# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# #
# # Examples:
# #
# #   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# #   Character.create(name: 'Luke', movie: movies.first)

Company.destroy_all
User.destroy_all
Complain.destroy_all

30.times do
    User.create(
        email:Faker::Internet.email,
        password: "123456"
    )
end 

20.times do 
    Company.create(name: Faker::Company.name)
end 

votos = ["Buena empresa", "Muy buena empresa", "Mala empresa", "Muy mala empresa", "Mediana"]
usuario = User.all
company = Company.all

250.times do
    Complain.create(
        content: votos.sample,
        user: usuario.sample,
        company: company.sample,
    )
end 
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?