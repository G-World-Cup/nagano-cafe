# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Admin.create!(
    email: 'abc@123.com',
    password: '123456',
    password_confirmation: '123456'
  )

Customer.create!(
  last_name: "山田",
  first_name: "太郎",
  last_name_kana: "ヤマダ",
  first_name_kana: "タロウ",
  postcode: "123456789",
  address: "大阪",
  phone_number: "987654321",
  email: "e@e",
  password: "password",
  password_confirmation: "password"
  )

Genre.create!(name: 'ケーキ')
Genre.create!(name: 'プリン')
Genre.create!(name: 'タルト')
Genre.create!(name: 'クッキー')
Genre.create!(name: '和菓子')
Genre.create!(name: 'ドーナツ')

  5.times do |i|
    cake = Product.new(
      name: 'Cheese cake',
      introduction: 'Yummy cheese cake from Nagano!',
      genre_id: 0,
      image_id: '',
      price: 450,
      is_active: true,
      genre: Genre.find(1)
      )

    cake.save
  end