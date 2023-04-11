require 'rails_helper'
RSpec.describe 'posts/show.html.erb', type: :feature do
  before(:each) do
    @author = User.create(name: 'Shahadat Hossain',
                          photo: 'https://images.unsplash.com/photo-1651684215020-f7a5b6610f23?&fit=crop&w=640',
                          bio: 'A skilled carpenter with over 15 years of experience, specializing ine.')
    @user = User.create(name: 'Rakibul Islam',
                        photo: 'https://images.unsplash.com/photo-1530268729831-4b0b9e170218?&fit=crop&w=640',
                        bio: 'A licensed therapist with expertise in cognitive-behavioral therapy and trauma-informed.')
    @post = Post.create(author: @author, title: 'First seed post', text: 'Lorem Ipsum is simple.')
    @comment = Comment.create(post: @post, user: @user, text: 'first comment')
    @comment2 = Comment.create(post: @post, user: @user, text: 'Second comment')
    visit user_post_path(@author, @post)
  end

  it 'should show post title' do
    expect(page).to have_content(@post.title)
  end

  it 'should show post author' do
    expect(page).to have_content(@post.author.name)
  end

  it 'should show post text' do
    expect(page).to have_content(@post.text)
  end

  it 'should show post comments_counter' do
    expect(page).to have_content @post.comments_counter
  end

  it 'should show post likes_counter' do
    expect(page).to have_content @post.likes_counter
  end

  it 'should show commment text' do
    expect(page).to have_content @comment.text
    expect(page).to have_content @comment2.text
  end

  it 'should show commmentr name' do
    expect(page).to have_content @comment.user.name
    expect(page).to have_content @comment2.user.name
  end
end
