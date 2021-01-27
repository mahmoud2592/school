# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user1 = User.create(name: "mahmoud", email: "mahmoud@gmail.com", image: "435345435345345345345335", password: "123456")

tag1 = Tag.create(name:"Action")
tag2 = Tag.create(name:"Adventure")
tag3 = Tag.create(name:"Sci-Fi")
tag4 = Tag.create(name:"Fantasy")

post1 = Post.create(title:"Game of Thrones", body:"Game of Thrones is an American fantasy drama television series created by David Benioff and D. B. Weiss for HBO. It is an adaptation of A Song of Ice and Fire, a series of fantasy novels by George R. R. Martin, the first of which is A Game of Thrones.",
user_id:1)
post2 = Post.create(title:"Body of Lies", body:"Body of Lies is a 2008 American action thriller film directed and produced by Ridley Scott and written by William Monahan. It stars Leonardo DiCaprio, Russell Crowe, and Mark Strong in the lead roles.",
    user_id:1)

post_tag1 = PostTag.create(post_id:1, tag_id:2)
post_tag2 = PostTag.create(post_id:2, tag_id:1)