# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

allUsers = {
    "users": [
    {
      "name": "Kelly",
      "username": "kells",
      "password": "hello"
    }]
}

allNotes = {
    "notes": [
    {
      "title": 'Christmas Shopping',
      "due_date": '12/23/2018',
      "color": 'green',
      "text": "Mom wants the black and gold Michael Kors shoes from TJ Maxx",
      "user_id": 1
    },
    {
      "title": 'Halloween Party',
      "due_date": '10/31/2018',
      "color": 'orange',
      "text": "Buy all the candy.",
      "user_id": 1
    }]
}

allUsers[:users].each do |user|
  User.create(user)
end

allNotes[:notes].each do |note|
  Note.create(note)
end