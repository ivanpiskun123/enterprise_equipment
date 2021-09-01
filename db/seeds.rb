# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# POSITIONS
Position.create([
  {name: "Python разработчик"},
  {name: "Java разработчик"},
  {name: "Ruby разработчик"},
  {name: "С# разработчик"},
  {name: "JavaScript разработчик"},
  {name: "HR-менеджер"},
  {name: "Главный рекрутер"},
  {name: "Руководитель отдела разработки"},
  {name: "Директор"},
  {name: "Начальник КО"}
  ])


# NOMINATIONS
names = ["Мышь","Клавиатура","Монитор","Компьютер","Ноутбук",
          "Наушники","Планшет","Электронная книга","Микрофон","Принтер","USB-флеш накопитель",]
path_to_icons = "#{Rails.root}/app/assets/images/icons/"

names.each_with_index do |n, idx|
  nomination = Nomination.create( { name: n, shelf_time: rand(1.5 .. 3.6).round(1) } )
  nomination.icon.attach(io: File.open(path_to_icons+idx.to_s+".jpg"), filename: idx.to_s+".jpg"  )
end


# USERS
def rand_work_exp
  rand(0.0 .. 5.3).round(1)
end

path_to_avatars = "#{Rails.root}/app/assets/images/avatars/"
imgs = ["0.jpg", "1.jpg","2.jpg","3.jpg","4.jpg",]

  u = User.create(
        {first_name: "Ирина", second_name: "Василенко", male: false, phone_number: "+375295689556",
            position_id: 6, email: "user123@gmail.com", work_experience: rand_work_exp,
             password: "admin123", password_confirmation: "admin123"})
    u.avatar.attach(io: File.open(path_to_avatars+imgs[0]), filename: imgs[0]  )

  u = User.create({first_name: "Владимир", second_name: "Бойко", male: true, is_admin: true, phone_number: "+375295789859",
              position: Position.last, email: "admin123@gmail.com", work_experience: rand_work_exp,
               password: "admin123", password_confirmation: "admin123"})
    u.avatar.attach(io: File.open(path_to_avatars+imgs[1]), filename: imgs[1]  )

  u = User.create(
    {first_name: "Евгений", second_name: "Новенький", male: true, phone_number: "+375337899511",
      position_id: 3, email: "user123@gmail.com", work_experience: rand_work_exp,
       password: "admin123", password_confirmation: "admin123"}
  )
  u.avatar.attach(io: File.open(path_to_avatars+imgs[2]), filename: imgs[2]  )

  u = User.create(
    {first_name: "Аркадий", second_name: "Беларченко", male: true, phone_number: "+375337897544",
      position_id: 2, email: "user123@gmail.com", work_experience: rand_work_exp,
       password: "admin123", password_confirmation: "admin123"}
  )
  u.avatar.attach(io: File.open(path_to_avatars+imgs[3]), filename: imgs[3]  )

  u = User.create(
    {first_name: "Анастасия", second_name: "Немцова", male: false, phone_number: "+375447891122",
     position_id: 4, email: "user123@gmail.com", work_experience: rand_work_exp,
      password: "admin123", password_confirmation: "admin123"}
  )
  u.avatar.attach(io: File.open(path_to_avatars+imgs[4]), filename: imgs[4]  )

  u = User.create(
      {first_name: "Тимур", second_name: "Босак", male: true, phone_number: "+375447894568",
       position_id: 5, email: "user123@gmail.com", work_experience: rand_work_exp,
        password: "admin123", password_confirmation: "admin123"}
      )


BreakdownCause.create([
  {body: "Естественный износ"},
  {body: "Брак (не работает после распаковки)"},
  {body: "Устройство перестало включаться после длительного простоя"},
  {body: "В устройство попала вода"},
  {body: "Было сломано по случайности"},
  {body: "Другая причина"}
  ])


Unit.create([
  {
    nomination_id: 1 , cost: 8, product_url: "https://www.21vek.by/mouses/m170910004642_logitech.html",
    user: User.first, breakdown_cause_id: rand(1..6), breaked_at: Date.today
  },
  {
    nomination_id: 1 , cost: 10, product_url: "https://www.21vek.by/mouses/m310910003986_logitech.html",
    user: User.first, breakdown_cause_id: rand(1..6), breaked_at: Date.today
  },

  ])
