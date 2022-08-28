# create users
@user_one = User.create(name: "Joshua Ivie", email: "joshua@joshuaivie.com", photo: "https://avatars.dicebear.com/api/micah/joshua-ivie.svg", bio: "Joshua is a 24 year old builder", posts_counter: 0, password: "password", password_confirmation: "password", confirmed_at: DateTime.now)
@user_two = User.create(name: "Sarah Ivie", email: "sarah@sarahivie.com", photo: "https://avatars.dicebear.com/api/micah/sarah-ivie.svg", bio: "Sarah is a 22 year old lawyer", posts_counter: 0, password: "password", password_confirmation: "password", confirmed_at: DateTime.now, role: "admin")
@user_three = User.create(name: "Naomi Ivie", email: "naomi@naomivie.com", photo: "https://avatars.dicebear.com/api/micah/naomi-ivie.svg", bio: "Sarah is an 18 year old student", posts_counter: 0, password: "password", password_confirmation: "password", confirmed_at: DateTime.now)

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