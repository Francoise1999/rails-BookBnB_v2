# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "open-uri"

puts "I clear the database"

Booking.delete_all
Book.delete_all
User.delete_all

puts "Deleted"

puts "Creating users"

vero = User.create(name: "Vero", email: 'vero@gmail.com', password: '123456')
michael = User.create(name: "Michael", email: 'michael@gmail.com', password: '123456')
marie = User.create(name: "Marie", email: 'marie@gmail.com', password: '123456')
paul = User.create(name: "Paul", email: 'paul@gmail.com', password: '123456')

puts "Creating books"

book1 = Book.create(title: "Traitors Gate",
  author: "Jeffrey Archer",
  description: "The race against time is about to begin…
  THE TOWER OF LONDON…
  Impenetrable. Well protected. Secure. Home to the most valuable jewels on earth. But once a year, the Metropolitan Police must execute the most secret operation in their armoury when they transport the Crown Jewels across London.
  SCOTLAND YARD…
  For four years, Chief Superindendent William Warwick – together with his second-in-command Inspector Ross Hogan – has been in charge of the operation. And for four years it’s run like clockwork.",
  category: "Novels",
  year: 2023,
  price: 23,
  user: vero)

book2 = Book.create(title: "The Buddhist Chef's Homestyle Cooking",
  author: "Jean-Philippe Cyr",
  description: "Full of traditional, crowd-pleasing recipes, veganized and packed full of flavor, The Buddhist Chef's Homestyle Cooking is a warm-hearted, comforting collection of recipes. The recipes are inspired by the two universal themes at the heart of every great meal—flavor and enjoying it with those you love—and are brought together with a dash of The Buddhist Chef's signature sense of humor.",
  category: "Cooking",
  year: 2023,
  price: 15,
  user: paul)

book3 = Book.create!(title: "Harry Potter and the Philosopher's Stone",
  author: "J.K. Rowling",
  description: "Harry Potter has never even heard of Hogwarts when the letters start dropping on the doormat at number four, Privet Drive. Addressed in green ink on yellowish parchment with a purple seal, they are swiftly confiscated by his grisly aunt and uncle. Then, on Harry's eleventh birthday, a great beetle-eyed giant of a man called Rubeus Hagrid bursts in with some astonishing news: Harry Potter is a wizard, and he has a place at Hogwarts School of Witchcraft and Wizardry. An incredible adventure is about to begin! These new editions of the classic and internationally bestselling, multi-award-winning series feature instantly pick-up-able new jackets by Jonny Duddle, with huge child appeal, to bring Harry Potter to the next generation of readers. It's time to PASS THE MAGIC ON ...",
  category: "Fiction",
  year: 2014,
  price: 11,
  user: marie)

book4 = Book.create!(title: "Beren and Lúthien",
  author: "J. R. R. Tolkien",
  description: "Painstakingly restored from Tolkien's manuscripts and presented for the first time as a continuous and standalone story, the epic tale of Beren and Luthien will reunite fans of The Hobbit and The Lord of the Rings with Elves and Men, Dwarves and Orcs and the rich landscape and creatures unique to Tolkien's Middle-earth.",
  category: "Fiction",
  year: 2017,
  price: 24,
  user: michael)


traitors_gate = URI.open("https://res.cloudinary.com/devskqpiz/image/upload/v1699582774/development/tzhyysze78xjd0ko0547llvnqcwz.jpg")
the_buddhist_chefs_homestyle_cooking = URI.open("https://res.cloudinary.com/devskqpiz/image/upload/v1699582774/development/9tq2oy7bhct58fxkh5uflzoea29n.jpg")
harry_potter = URI.open("https://res.cloudinary.com/devskqpiz/image/upload/v1699582775/development/mzzdwvoyd8j8zzfpqoufflwx6knr.jpg")
beren_and_luthien= URI.open("https://res.cloudinary.com/devskqpiz/image/upload/v1699582776/development/mpp9cuwpgwhyz13czxpug3hx9xfk.jpg")

book1.photo.attach(io: traitors_gate, filename: "book1.png", content_type: "image/png")
book2.photo.attach(io: the_buddhist_chefs_homestyle_cooking, filename: "book2.png", content_type: "image/png")
book3.photo.attach(io: harry_potter, filename: "book3.png", content_type: "image/png")
book4.photo.attach(io: beren_and_luthien, filename: "book4.png", content_type: "image/png")

puts "Creating bookings"

booking1 = Booking.create(date: Date.today, user: vero, book: book1, accepted: false)
booking2 = Booking.create(date: Date.today, user: michael, book: book2, accepted: false)
booking3 = Booking.create(date: Date.today, user: marie, book: book2, accepted: false)
