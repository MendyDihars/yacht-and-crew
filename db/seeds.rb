puts "cleaning database"
Booking.destroy_all
Review.destroy_all
Yacht.destroy_all
User.destroy_all

user = User.create(first_name: "Apops", last_name: "Sentucq", email: "apops@gmail.com", password: "123456")

photos_url = [
  "https://static1.squarespace.com/static/58089b7846c3c44d6e2ac2c0/t/580f789ce6f2e1af3c2f0d49/1477408926813/PJ170-mail_Page_04.jpg?format=2500w",
  "http://the-indexe.com/wp-content/uploads/2016/01/Niniette-Palmer-Johnson.jpg",
  "http://www.absoluteboat.com/images/palmer-johnson-01.jpg",
  "http://www.asia-pacificboating.com/uploads/features/2011/09/103s-flybridge-2nd-view.jpg",
  "http://static4.businessinsider.com/image/4f58f2276bb3f76c45000003-1200/wally-118-yacht-of-the-week.jpg",
  "https://www.ypigroup.com/medias/yachts/3002812/exterior/yacht-dark-shadow-ypi-exterior-2.jpg",
  "https://djproe.files.wordpress.com/2012/06/wally-118-yacht-02.jpg",
  "http://img.nauticexpo.fr/images_ne/photo-g/20652-5051749.jpg",
  "https://www.riva-yacht.com/uploadB2B/models/images/photogallery/riva/zoom/8704.jpg",
  "http://i.dailymail.co.uk/i/pix/2012/10/08/article-2214718-0007818C00000258-180_634x455.jpg"
]
n = 0
puts "creating  arcachon yachts"
10.times do
  yacht = User.last.yachts.new
  yacht.name = Faker::Ancient.hero
  yacht.crew = "#{Faker::Name.name_with_middle}, #{Faker::Name.name}, #{Faker::LordOfTheRings.character}, #{Faker::GameOfThrones.character}, #{Faker::Pokemon.name}"
  yacht.location = ["14 Quai Goslar, Arcachon", "6 Quai Goslar, Arcachon", "53 Boulevard de la Plage, Arcachon", "2 rue Hovy, Arcachon", "6 rue des Marins, Arcachon"].sample
  yacht.max_capacity = rand(5..10)
  yacht.day_price = [400, 450, 500, 550, 600, 650, 700, 750, 800, 850, 900, 950, 1000].sample
  yacht.photo_url = photos_url[n]
  n += 1
  yacht.save
  print "🏄 "
end

puts 'Urls SHUFFLELING'
photos_url.shuffle!

puts "creating  cannes yachts"
n = 0
10.times do
  yacht = User.last.yachts.new
  yacht.name = Faker::Ancient.hero
  yacht.crew = "#{Faker::Name.name_with_middle}, #{Faker::Name.name}, #{Faker::LordOfTheRings.character}, #{Faker::GameOfThrones.character}, #{Faker::Pokemon.name}"
  yacht.location = ["Pointe Croisette, Cannes", "Quai Numéro 1, Cannes", "1 Jetée Albert Edouard, Cannes", "2 Boulevard du Midi Jean Hibert, Cannes"].sample
  yacht.max_capacity = rand(5..10)
  yacht.day_price = [400, 450, 500, 550, 600, 650, 700, 750, 800, 850, 900, 950, 1000].sample
  yacht.photo_url = photos_url[n]
  n += 1
  yacht.save
  print "🏄 "
end
puts " Lets navigate ⚓ "
