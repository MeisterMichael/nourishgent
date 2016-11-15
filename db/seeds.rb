# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

helpers = ActionController::Base.helpers

default_password = ENV['DEFAULT_PASSWORD'] || 'Test123'

User.destroy_all
SwellMedia::Category.destroy_all
SwellMedia::Article.destroy_all

bio = <<STRING
Hi, glad to know you were here. I'm Michael, newbie nutrition blogger. I like to go anywhere to hunting some food and share with other. About taste, benefit, and where you can findout a good place to eat.
STRING
short_bio = bio

admin_user = User.create( name: 'nourishgent', email: 'meister@spacekace.com', first_name: 'Michael', last_name: 'Ferguson', status: 'active', role: 'admin', password: default_password, short_bio: short_bio, bio: bio, properties: { "facebook_id" => 'nourishgent', "twitter_id" => 'nourishgent', "pinterest_id" => 'nourishgent', "instagram_id" => 'nourishgent', "avatar_large" => nil } )


food			= SwellMedia::Category.create( status: 'active', availability: 'anyone', name: 'Food' )
fitness		= SwellMedia::Category.create( status: 'active', availability: 'anyone', name: 'Fitness' )
hacks			= SwellMedia::Category.create( status: 'active', availability: 'anyone', name: 'Hacks' )


content = <<HTML
<p>
Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.
</p>
<p>
The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.
</p>
HTML
article = SwellMedia::Article.create( user: admin_user, publish_at: 1.week.ago, title: 'Are you a Matcha Monk or a Coffee Addict?', subtitle: '', description: '', content: content, category: food, avatar: 'http://cdn1.nourishgent.com/blog/matcha_monk_350x350.jpg', cover_path: 'http://cdn1.nourishgent.com/blog/matcha_monk_1200x800.jpg', avatar_urls: { featured: 'http://cdn1.nourishgent.com/blog/matcha_monk_320x450.jpg' }, tags: ['GreenTea','Tea','Matcha','Energy','Natural'], featured: 1 )
puts article.url




content = <<HTML
<p>
Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.
</p>
<p>
The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.
</p>
HTML
article = SwellMedia::Article.create( user: admin_user, publish_at: 10.hours.ago, title: 'Veggie Ramen', subtitle: '', description: '', content: content, category: food, avatar: 'http://cdn1.nourishgent.com/blog/zoodles_350x350.jpg', cover_path: 'http://cdn1.nourishgent.com/blog/zoodles_1200x800.jpg', avatar_urls: { featured: 'http://cdn1.nourishgent.com/blog/zoodles_320x450.jpg' }, tags: ['Recipies','KidApproved','Nutritious'], featured: 2 )
puts article.url




content = <<HTML
<p>
Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.
</p>
<p>
The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.
</p>
HTML
article = SwellMedia::Article.create( user: admin_user, publish_at: 1.minute.ago, title: 'Pomegranate Seed Harvesting Hack', subtitle: '', description: '', content: content, category: hacks, avatar: 'http://cdn1.nourishgent.com/blog/pom_350x350.jpg', cover_path: 'http://cdn1.nourishgent.com/blog/pom_1200x800.jpg', avatar_urls: { featured: 'http://cdn1.nourishgent.com/blog/pom_320x450.jpg' }, tags: ['TimeSaver', 'FreshFruit'], featured: 3 )
puts article.url




content = <<HTML
<p>
Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.
</p>
<p>
The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.
</p>
HTML
article = SwellMedia::Article.create( user: admin_user, publish_at: 30.seconds.ago, title: '2 Ingredient Chocolate Superfood Pudding', subtitle: '', description: '', content: content, category: food, avatar: 'http://cdn1.nourishgent.com/blog/chia_pudding_350x350.jpg', cover_path: 'http://cdn1.nourishgent.com/blog/chia_pudding_1200x800.jpg', avatar_urls: { featured: 'http://cdn1.nourishgent.com/blog/chia_pudding_320x450.jpg' }, tags: ['Recipies','Superfood','Chocolate', 'KidApproved'], featured: 4 )
puts article.url