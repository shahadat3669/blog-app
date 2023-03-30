# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# users seeds
first_user = User.create(name: 'Shahadat Hossain', photo: 'https://images.unsplash.com/photo-1651684215020-f7a5b6610f23?&fit=crop&w=640', bio: 'A skilled carpenter with over 15 years of experience, specializing in custom furniture design and installation.')
second_user = User.create(name: 'Rakibul Islam', photo: 'https://images.unsplash.com/photo-1530268729831-4b0b9e170218?&fit=crop&w=640', bio: 'A licensed therapist with expertise in cognitive-behavioral therapy and trauma-informed care.')
third_user = User.create(name: 'Monir Hossain', photo: 'https://images.unsplash.com/photo-1583692331507-fc0bd348695d?&fit=crop&w=640', bio: 'A seasoned project manager with experience in managing complex projects across multiple industries.')
fourth_user = User.create(name: 'Siful Islam', photo: 'https://images.unsplash.com/photo-1499996860823-5214fcc65f8f?&fit=crop&w=640', bio: 'A seasoned project manager with experience in managing complex projects across multiple industries.')
fifth_user = User.create(name: 'Sohidul Islam', photo: 'https://images.unsplash.com/photo-1552374196-c4e7ffc6e126?&fit=crop&w=640', bio: 'An experienced marketing specialist with expertise in digital marketing, branding, and social media management.')

# post seeds
first_post = Post.create(author: first_user, title: 'First seed post', text: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.')
second_post = Post.create(author: first_user, title: 'Second seed post', text: 'The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using Content here, content here, making it look like readable English.')
third_post = Post.create(author: first_user, title: 'Third seed post', text: 'This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32 Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock.')
fourth_post = Post.create(author: first_user, title: 'Fourth seed post', text: 'All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet.')
fifth_post = Post.create(author: second_user, title: 'Fifth seed post', text: 'Aenean vitae volutpat nisl, sed hendrerit arcu. Proin quis mi eu dolor scelerisque volutpat. Nulla ultricies sollicitudin erat, nec tincidunt libero vehicula pharetra. Nunc risus nulla, commodo ut ex ut, elementum vestibulum ligula. Cras eleifend faucibus tortor a porttitor Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi tristique quis lacus ut dictum.')
sixth_post = Post.create(author: second_user, title: 'Sixth seed post', text: 'Nulla facilisi. Nam consectetur urna eu risus cursus venenatis. Nam rhoncus maximus ante. Aenean vitae volutpat nisl, sed hendrerit arcu. Proin quis mi eu dolor scelerisque volutpat. Nulla ultricies sollicitudin erat, nec tincidunt libero vehicula pharetra. Nunc risus nulla, commodo ut ex ut, elementum vestibulum ligula. Cras eleifend faucibus tortor a porttitor.')
seventh_post = Post.create(author: second_user, title: 'Seventh seed post', text: 'Nunc risus nulla, commodo ut ex ut, elementum vestibulum ligula. Cras eleifend faucibus tortor a porttitor Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi tristique quis lacus ut dictum. Nulla facilisi. Nam consectetur urna eu risus cursus venenatis. Nam rhoncus maximus ante. Aenean vitae volutpat nisl, sed hendrerit arcu. Proin quis mi eu dolor scelerisque volutpat.')
eighth_post = Post.create(author: third_user, title: 'Eight seed post', text: 'Donec eleifend lacus vel tortor pharetra feugiat Vivamus libero libero, elementum in rhoncus in, porttitor quis orci. Sed auctor augue euismod est faucibus ultrices. Duis placerat finibus ligula, aliquet congue sapien molestie sit amet. Suspendisse at magna elit. Suspendisse enim dui, vehicula ac commodo quis, placerat at lorem. Maecenas finibus, ante eu tincidunt auctor, lectus odio facilisis metus, ut aliquam elit sapien ac nibh. Donec eleifend lacus vel tortor pharetra feugiat.')
ninht_post = Post.create(author: third_user, title: 'Nine seed post', text: 'Vivamus libero libero, elementum in rhoncus in, porttitor quis orci. Sed auctor augue euismod est faucibus ultrices. Duis placerat finibus ligula, aliquet congue sapien molestie sit amet. Suspendisse at magna elit. Suspendisse enim dui, vehicula ac commodo quis, placerat at lorem. Maecenas finibus, ante eu tincidunt auctor, lectus odio facilisis metus, ut aliquam elit sapien ac nibh. Donec eleifend lacus vel tortor pharetra feugiat Vivamus libero libero, elementum in rhoncus in, porttitor quis orci.')
tenth_post = Post.create(author: fourth_user, title: 'Tenth seed post', text: 'Vivamus libero libero, elementum in rhoncus in, porttitor quis orci. Sed auctor augue euismod est faucibus ultrices. Duis placerat finibus ligula, aliquet congue sapien molestie sit amet. Suspendisse at magna elit. Suspendisse enim dui, vehicula ac commodo quis, placerat at lorem. Maecenas finibus, ante eu tincidunt auctor, lectus odio facilisis metus, ut aliquam elit sapien ac nibh.')

# comment seeds
first_comment = Comment.create(post: first_post, user: first_user, text: 'Sed auctor augue euismod est faucibus ultrices.')
second_comment = Comment.create(post: first_post, user: second_user, text: 'Suspendisse at magna elit.' )
third_comment = Comment.create(post: first_post, user: third_user, text: 'Nam consectetur urna eu risus cursus venenatis.')
fourth_comment = Comment.create(post: first_post, user: fourth_user, text: 'Maecenas finibus, ante eu tincidunt auctor.')
fifth_comment = Comment.create(post: first_post, user: fifth_user, text: 'Vivamus libero libero, elementum in rhoncus in.')
sixth_comment = Comment.create(post: first_post, user: first_user, text: 'Donec eleifend lacus vel tortor pharetra.')
seventh_comment = Comment.create(post: second_post, user: third_user, text: 'Proin quis mi eu dolor scelerisque volutpat.')
eighth_comment = Comment.create(post: second_post, user: fourth_user, text: 'Nunc risus nulla, commodo ut ex ut, elementum vestibulum ligula.')
ninth_comment = Comment.create(post: third_post, user: first_user, text: 'Donec eleifend lacus vel tortor pharetra.')
tenth_comment = Comment.create(post: third_post, user: second_user, text: 'Sed auctor augue euismod est faucibus ultrices.')
eleventh_comment = Comment.create(post: third_post, user: third_user, text: 'It to make a type specimen book.t')
twelfth_comment = Comment.create(post: fourth_post, user: fourth_user, text: 'This is my comment')
thirteenth_comment = Comment.create(post: fourth_post, user: fifth_user, text: 'Proin quis mi eu dolor scelerisque volutpat.')
fourteenth_comment = Comment.create(post: fourth_post, user: second_user, text: 'Sed auctor augue euismod est faucibus ultrices.')

# like seeds 
first_like = Like.create(post: first_post, user: first_user)
second_like = Like.create(post: first_post, user: second_user)
third_like = Like.create(post: first_post, user: third_user)
fourth_like = Like.create(post: first_post, user: fourth_user)
fifth_like = Like.create(post: first_post, user: fifth_user)
sixth_like = Like.create(post: second_post, user: second_user)
seventh_like = Like.create(post: seventh_post, user: third_user)
eighth_like = Like.create(post: second_post, user: fourth_user)
ninth_like = Like.create(post: third_post, user: first_user)
tenth_like = Like.create(post: fourth_post, user: second_user)
