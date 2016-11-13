# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

default_password = ENV['DEFAULT_PASSWORD'] || 'Test123'

User.destroy_all
SwellMedia::Category.destroy_all
SwellMedia::Article.destroy_all

bio = <<STRING
Hi, glad to know you were here. I'm Michael, newbie nutrition blogger. I like to go anywhere to hunting some food and share with other. About taste, benefit, and where you can findout a good place to eat.
STRING
short_bio = bio

admin_user = User.create( name: 'nourishgent', email: 'meister@spacekace.com', first_name: 'Michael', last_name: 'Ferguson', status: 'active', role: 'admin', password: default_password, short_bio: short_bio, bio: bio, properties: { "facebook_id" => 'nourishgent', "twitter_id" => 'nourishgent', "pinterest_id" => 'nourishgent', "instagram_id" => 'nourishgent' } )


food			= SwellMedia::Category.create( status: 'active', availability: 'anyone', name: 'Recipes' )
fitness		= SwellMedia::Category.create( status: 'active', availability: 'anyone', name: 'Fitness' )
tips			= SwellMedia::Category.create( status: 'active', availability: 'anyone', name: 'Life Hacks' )


content = <<HTML
<p>
Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.
</p>
<p>
The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.
</p>
HTML
article = SwellMedia::Article.create( user: admin_user, publish_at: 1.week.ago, title: 'Are you a Matcha Monk or a Coffee Addict?', subtitle: '', description: '', content: content, category: food, avatar: 'http://www.paperandtea.com/shop/media/catalog/product/cache/2/small_image/750x/9df78eab33525d08d6e5fb8d27136e95/1/0/10881-1-1-321-matcha-konomi-do-square.jpg', cover_path: 'https://cdn-images-1.medium.com/max/1200/1*SdoquAaxOSRzRyKZZUrH0w.jpeg', tags: ['GreenTea','Tea','Matcha','Energy','Natural'] )
puts article.url




content = <<HTML
<p>
Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.
</p>
<p>
The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.
</p>
HTML
article = SwellMedia::Article.create( user: admin_user, publish_at: 10.hours.ago, title: 'Good for and approved by your kids Ramen Recipe', subtitle: '', description: '', content: content, category: food, avatar: 'http://cdn1.bostonmagazine.com/wp-content/uploads/2013/01/ramen-3.jpg', cover_path: 'https://cdn-images-1.medium.com/max/1200/1*SdoquAaxOSRzRyKZZUrH0w.jpeg', tags: ['GreenTea','Tea','Matcha','Energy','Natural'] )
puts article.url




content = <<HTML
<p>
Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.
</p>
<p>
The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.
</p>
HTML
article = SwellMedia::Article.create( user: admin_user, publish_at: 1.minute.ago, title: 'Pomegranate Seed Harvesting Hack', subtitle: '', description: '', content: content, category: food, avatar: 'https://img0.etsystatic.com/133/0/7136734/il_fullxfull.961658064_4mu3.jpg', cover_path: 'https://cdn-images-1.medium.com/max/1200/1*SdoquAaxOSRzRyKZZUrH0w.jpeg', tags: ['GreenTea','Tea','Matcha','Energy','Natural'] )
puts article.url