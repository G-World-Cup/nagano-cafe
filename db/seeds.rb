# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Admin.create!(
    email: 'admin@naganocake.com',
    password: '123456',
    password_confirmation: '123456'
  )

Customer.create!(
  last_name: "山田",
  first_name: "太郎",
  last_name_kana: "ヤマダ",
  first_name_kana: "タロウ",
  postcode: "44329606",
  address: "大阪二十日町",
  phone_number: "030231973",
  email: "yamada@yafoo.com",
  password: "password",
  password_confirmation: "password"
  )

  Customer.create!(
  last_name: "山本",
  first_name: "二郎",
  last_name_kana: "ヤマモト",
  first_name_kana: "ジロウ",
  postcode: "04024876",
  address: "大阪十九町",
  phone_number: "0582863",
  email: "yamamoto@qmail.com",
  password: "password",
  password_confirmation: "password"
  )

  Customer.create!(
  last_name: "山口",
  first_name: "三太郎",
  last_name_kana: "ヤマグチ",
  first_name_kana: "サンタロウ",
  postcode: "00354967",
  address: "大阪十八町",
  phone_number: "080394656",
  email: "yamaguchi@headbook.com",
  password: "password",
  password_confirmation: "password"
  )

  Customer.create!(
  last_name: "山崎",
  first_name: "四太郎",
  last_name_kana: "ヤマザキ",
  first_name_kana: "ヨンタロウ",
  postcode: "034283762",
  address: "大阪十七町",
  phone_number: "070674285",
  email: "yamazaki@zwitter.com",
  password: "password",
  password_confirmation: "password"
  )

Genre.create!(name: 'ケーキ')
Genre.create!(name: 'プリン')
Genre.create!(name: 'タルト')
Genre.create!(name: 'クッキー')
Genre.create!(name: '和菓子')

cake1 = Product.new(
    name: 'チーズケーキ',
    introduction: '令和２年に長野県でのチーズケーキコンテストで一位をとったチーズケーキでございます。',
    genre_id: 1,
    image_id: '',
    price: 500,
    is_active: true,
    genre: Genre.find(1)
  )

  cake1.image.attach(io: File.open(File.join(Rails.root, '/app/assets/images/cheese_cake.jpg')), filename: "cheese_cake.jpg")
  cake1.save

  cake2 = Product.new(
    name: 'キラキラカップケーキ',
    introduction: 'とてもふわふわで、お子様に人気一番のカップケーキでございます。',
    genre_id: 1,
    image_id: '',
    price: 400,
    is_active: true,
    genre: Genre.find(1)
  )

  cake2.image.attach(io: File.open(File.join(Rails.root,'/app/assets/images/cupcake.jpg')), filename: "cupcake.jpg")
  cake2.save

  cake3 = Product.new(
    name: 'タルトショコラ',
    introduction: 'チョコが好きなお方にはオススメです。',
    genre_id: 3,
    image_id: '',
    price: 800,
    is_active: true,
    genre: Genre.find(3)
  )

  cake3.image.attach(io: File.open(File.join(Rails.root,'/app/assets/images/chocotart.jpg')), filename: "chocotart.jpg")
  cake3.save

  cake4 = Product.new(
    name: 'タピオカプリン',
    introduction: 'タピオカプリンは珍しいですが、ぜひお試しください。',
    genre_id: 2,
    image_id: '',
    price: 600,
    is_active: true,
    genre: Genre.find(2)
  )

  cake4.image.attach(io: File.open(File.join(Rails.root,'/app/assets/images/pudding.jpg')), filename: "pudding.jpg")
  cake4.save

  cake5 = Product.new(
    name: '苺大福',
    introduction: '季節のいちごを使用して、お子様からお年寄りまで、誰でも大好きな苺大福でございます。',
    genre_id: 5,
    image_id: '',
    price: 600,
    is_active: true,
    genre: Genre.find(5)
  )

  cake5.image.attach(io: File.open(File.join(Rails.root,'/app/assets/images/ichigo.jpg')), filename: "ichigo.jpg")
  cake5.save