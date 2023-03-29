# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# users seed
first_user = User.create(name: 'Shahadat Hossain', photo: 'https://images.unsplash.com/photo-1651684215020-f7a5b6610f23?&fit=crop&w=640', bio: 'A skilled carpenter with over 15 years of experience, specializing in custom furniture design and installation.')
second_user = User.create(name: 'Rakibul Islam', photo: 'https://images.unsplash.com/photo-1530268729831-4b0b9e170218?&fit=crop&w=640', bio: 'A licensed therapist with expertise in cognitive-behavioral therapy and trauma-informed care.')
third_user = User.create(name: 'Monir Hossain', photo: 'https://images.unsplash.com/photo-1583692331507-fc0bd348695d?&fit=crop&w=640', bio: 'A seasoned project manager with experience in managing complex projects across multiple industries.')
fourth_user = User.create(name: 'Siful Islam', photo: 'https://images.unsplash.com/photo-1499996860823-5214fcc65f8f?&fit=crop&w=640', bio: 'A seasoned project manager with experience in managing complex projects across multiple industries.')
fifth_user = User.create(name: 'Sohidul Islam', photo: 'https://images.unsplash.com/photo-1552374196-c4e7ffc6e126?&fit=crop&w=640', bio: 'An experienced marketing specialist with expertise in digital marketing, branding, and social media management.')
