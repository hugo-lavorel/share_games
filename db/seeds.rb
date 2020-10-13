# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Game.destroy_all
User.destroy_all

puts 'Creating user'

jean = User.new(
            email:"jean.martin@test.com",
            first_name:"Jean",
            last_name:"Martin",
            address:"56 avenue Victor Hugo, 75001 PARIS",
            phone_number: "01 98 29 22 76",
            password: "mdpmdp"
            )

jean.save!

paul = User.new(
            email:"Paul.Dupond@test.com",
            first_name:"Paul",
            last_name:"Dupond",
            address:"36 quai de la rapé, 92120 MONTROUGE",
            phone_number: "01 29 42 49 01",
            password: "mdpmdp"
            )

paul.save!

puts 'End creating user'

puts 'Creating games'

  catan = Game.new(name: "Catan",
                    category:"strategy",
                    player_min: 3,
                    player_max: 4,
                    condition: "new",
                    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam mollis, odio ac viverra consequat, purus nibh mattis sem, vitae vehicula massa sapien vitae mi. Nam convallis mollis felis sed aliquam. Phasellus rutrum sem blandit tortor pellentesque, nec tempor magna ullamcorper. In id consectetur nunc, non mollis neque. Aliquam scelerisque egestas eros a ultricies. Duis porttitor consequat mattis. Integer efficitur ultrices dictum. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut sit amet pellentesque mi.",
                    price_per_day: 5
                    )
  catan.user = jean
  catan.save!

  Rummibuk = Game.new(name: "Rummibuk",
                    category:"classique",
                    player_min: 2,
                    player_max: 4,
                    condition: "damaged",
                    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam mollis, odio ac viverra consequat, purus nibh mattis sem, vitae vehicula massa sapien vitae mi. Nam convallis mollis felis sed aliquam. Phasellus rutrum sem blandit tortor pellentesque, nec tempor magna ullamcorper. In id consectetur nunc, non mollis neque. Aliquam scelerisque egestas eros a ultricies. Duis porttitor consequat mattis. Integer efficitur ultrices dictum. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut sit amet pellentesque mi.",
                    price_per_day: 3
                    )
  Rummibuk.user = jean
  Rummibuk.save!

  Takenoko = Game.new(name: "Takenoko",
                    category:"strategy",
                    player_min: 2,
                    player_max: 4,
                    condition: "new",
                    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam mollis, odio ac viverra consequat, purus nibh mattis sem, vitae vehicula massa sapien vitae mi. Nam convallis mollis felis sed aliquam. Phasellus rutrum sem blandit tortor pellentesque, nec tempor magna ullamcorper. In id consectetur nunc, non mollis neque. Aliquam scelerisque egestas eros a ultricies. Duis porttitor consequat mattis. Integer efficitur ultrices dictum. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut sit amet pellentesque mi.",
                    price_per_day: 4
                    )
  Takenoko.user = jean
  Takenoko.save!

  DonjonAndDragon = Game.new(name: "Donjon and Dragon",
                    category:"role-playing",
                    player_min: 3,
                    player_max: 10,
                    condition: "good",
                    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam mollis, odio ac viverra consequat, purus nibh mattis sem, vitae vehicula massa sapien vitae mi. Nam convallis mollis felis sed aliquam. Phasellus rutrum sem blandit tortor pellentesque, nec tempor magna ullamcorper. In id consectetur nunc, non mollis neque. Aliquam scelerisque egestas eros a ultricies. Duis porttitor consequat mattis. Integer efficitur ultrices dictum. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut sit amet pellentesque mi.",
                    price_per_day: 10
                    )
  DonjonAndDragon.user = jean
  DonjonAndDragon.save!

  wonders = Game.new(name: "Seven Wonders",
                    category:"strategy",
                    player_min: 2,
                    player_max: 6,
                    condition: "good",
                    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam mollis, odio ac viverra consequat, purus nibh mattis sem, vitae vehicula massa sapien vitae mi. Nam convallis mollis felis sed aliquam. Phasellus rutrum sem blandit tortor pellentesque, nec tempor magna ullamcorper. In id consectetur nunc, non mollis neque. Aliquam scelerisque egestas eros a ultricies. Duis porttitor consequat mattis. Integer efficitur ultrices dictum. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut sit amet pellentesque mi.",
                    price_per_day: 8
                    )
  wonders.user = paul
  wonders.save!

  Crime = Game.new(name: "Chronicles of Crime",
                    category:"role-playing",
                    player_min: 2,
                    player_max: 4,
                    condition: "new",
                    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam mollis, odio ac viverra consequat, purus nibh mattis sem, vitae vehicula massa sapien vitae mi. Nam convallis mollis felis sed aliquam. Phasellus rutrum sem blandit tortor pellentesque, nec tempor magna ullamcorper. In id consectetur nunc, non mollis neque. Aliquam scelerisque egestas eros a ultricies. Duis porttitor consequat mattis. Integer efficitur ultrices dictum. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut sit amet pellentesque mi.",
                    price_per_day: 7
                    )
  Crime.user = paul
  Crime.save!

  Uno = Game.new(name: "Uno",
                    category:"classique",
                    player_min: 2,
                    player_max: 8,
                    condition: "damaged",
                    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam mollis, odio ac viverra consequat, purus nibh mattis sem, vitae vehicula massa sapien vitae mi. Nam convallis mollis felis sed aliquam. Phasellus rutrum sem blandit tortor pellentesque, nec tempor magna ullamcorper. In id consectetur nunc, non mollis neque. Aliquam scelerisque egestas eros a ultricies. Duis porttitor consequat mattis. Integer efficitur ultrices dictum. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut sit amet pellentesque mi.",
                    price_per_day: 2
                    )
  Uno.user = paul
  Uno.save!

puts 'End creating games'
