# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "initialize destruction"
Yacht.destroy_all
User.destroy_all
puts "the database is clean"

users = [
  { email: "robert@toto.com", password: "azerty", first_name: "robert", last_name: "totot"},
  { email: "mickey@toto.com", password: "azerty", first_name: "mickey", last_name: "mouse"},
  { email: "jean@toto.com", password: "azerty", first_name: "jean", last_name: "til"}
]

User.create!(users)
puts "users created"

yachts = [
  {name: "withoutname", crew: "1234", description: "Lorem ipsum dolor sit amet,
    consectetur adipiscing elit. Nam eget dolor vitae.", location: "bordeaux",
    max_capacity: 3
  },
  {name: "noname", crew: "1234", description: "Lorem ipsum dolor sit amet,
    consectetur adipiscing elit. Nam eget dolor vitae.", location: "arcachon",
    max_capacity: 4
  },
  {name: "zoro", crew: "1234", description: "Lorem ipsum dolor sit amet,
    consectetur adipiscing elit. Nam eget dolor vitae.", location: "monaco",
    max_capacity: 5
  },
  {name: "batman", crew: "1234", description: "Lorem ipsum dolor sit amet,
    consectetur adipiscing elit. Nam eget dolor vitae.", location: "cancun",
    max_capacity: 6
  },
  {name: "superman", crew: "1234", description: "Lorem ipsum dolor sit amet,
    consectetur adipiscing elit. Nam eget dolor vitae.", location: "miami",
    max_capacity: 7
  },
  {name: "spiderman", crew: "1234", description: "Lorem ipsum dolor sit amet,
    consectetur adipiscing elit. Nam eget dolor vitae.", location: "cannes",
    max_capacity: 8
  }
]

Yacht.create!(yachts)
puts "yachts created"
