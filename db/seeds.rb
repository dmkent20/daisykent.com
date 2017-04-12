# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.create(name: 'Lifestyle', created_from: 'posts', creator_id: '1')
Category.create(name: 'Food', created_from: 'posts', creator_id: '1')
Category.create(name: 'Health', created_from: 'posts', creator_id: '1')
Category.create(name: 'Fasion', created_from: 'posts', creator_id: '1')

Subject.create(name: 'Lifestyle')
Subject.create(name: 'Food')
Subject.create(name: 'Health')
Subject.create(name: 'Fasion')

Admin.create(email: "test@test.com", password: 'test')
