# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
users = []

5.times do
    user = User.create!(
      username: Faker::Beer.name,
      email: Faker::Internet.safe_email,
      password: '123',
      password_confirmation: '123'
    )
    users << user
    2.times do
      album = user.albums.create!(
        title: Faker::Space.moon
      )

      5.times do
        album.photos.create!(
        url: Faker::LoremPixel.image("50x60"),
        caption: Faker::Name.title
        )
      end
    end
  end
