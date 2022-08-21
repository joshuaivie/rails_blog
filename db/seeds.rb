# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# create users
@user_one = User.create(name: "Joshua Ivie", photo: "https://avatars.dicebear.com/api/micah/joshua-ivie.svg", bio: "Joshua is a 24 year old builder", posts_counter: 0)
@user_two = User.create(name: "Sarah Ivie", photo: "https://avatars.dicebear.com/api/micah/sarah-ivie.svg", bio: "Sarah is a 22 year old lawyer", posts_counter: 0)
@user_three = User.create(name: "Naomi Ivie", photo: "https://avatars.dicebear.com/api/micah/naomi-ivie.svg", bio: "Sarah is an 18 year old student", posts_counter: 0)

# create posts
@post_one = Post.create(author: @user_one, title: "Joshua's First Post", text: "This is Joshua's first post. I hope you enjoy it.", comments_counter: 0, likes_counter: 0)
@post_two = Post.create(author: @user_one, title: "Joshua's Second Post", text: "This is Joshua' second post. I hope you enjoy it.", comments_counter: 0, likes_counter: 0)
@post_three = Post.create(author: @user_one, title: "Joshua's Third Post", text: "This is Joshua's third post. I hope you enjoy it.", comments_counter: 0, likes_counter: 0)
@post_four = Post.create(author: @user_one, title: "Joshua's Fourth Post", text: "This is Joshua's fourth post. I hope you enjoy it.", comments_counter: 0, likes_counter: 0)
@post_five = Post.create(author: @user_one, title: "Joshua's Fifth Post", text: "This is Joshua's fifth post. I hope you enjoy it.", comments_counter: 0, likes_counter: 0)

# create commenets
@comment_one = Comment.create(text: "Sarah thinks this is a great post", author: @user_two, post: @post_one)
@comment_two = Comment.create(text: "Sarah thinks this is a great post", author: @user_two, post: @post_two)
@comment_three = Comment.create(text: "Sarah thinks this is a great post", author: @user_two, post: @post_three)
@comment_four = Comment.create(text: "Sarah thinks this is a great post", author: @user_two, post: @post_four)
@comment_five = Comment.create(text: "Sarah thinks this is a great post", author: @user_two, post: @post_six)
@comment_six = Comment.create(text: "Naomi thinks this is a great post", author: @user_three, post: @post_one)
@comment_seven = Comment.create(text: "Naomi thinks this is a great post", author: @user_three, post: @post_two)
@comment_eight = Comment.create(text: "Naomi thinks this is a great post", author: @user_three, post: @post_three)
@comment_nine = Comment.create(text: "Naomi thinks this is a great post", author: @user_three, post: @post_four)
@comment_ten = Comment.create(text: "Naomi thinks this is a great post", author: @user_three, post: @post_six)

# create likes
@like_one = Like.create(author:@user_one, post: @post_one)
@like_one = Like.create(author:@user_one, post: @post_two)
@like_one = Like.create(author:@user_one, post: @post_three)
@like_one = Like.create(author:@user_one, post: @post_four)
@like_one = Like.create(author:@user_one, post: @post_five)
@like_one = Like.create(author:@user_two, post: @post_one)
@like_one = Like.create(author:@user_two, post: @post_two)
@like_one = Like.create(author:@user_two, post: @post_three)
@like_one = Like.create(author:@user_two, post: @post_four)
@like_one = Like.create(author:@user_two, post: @post_five)
@like_one = Like.create(author:@user_three, post: @post_one)
@like_one = Like.create(author:@user_three, post: @post_two)
@like_one = Like.create(author:@user_three, post: @post_three)
@like_one = Like.create(author:@user_three, post: @post_four)
@like_one = Like.create(author:@user_three, post: @post_five)