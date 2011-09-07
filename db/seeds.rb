# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Author.create(email: 'test@test.com', password: 'admin')
Category.create(name: 'General')
Post.create(title: 'Hello World!', )
PostCategory.create(post_id: 1, category_id: 1, author_id: 1, content: "Hello World, from Quill!")
Page.create(title: 'About Us', content: 'This is a test page', header: 1, sidebar: 1, rank: 1)