require 'rails_helper'
RSpec.describe 'posts/index.html.erb', type: :feature do
  before(:each) do
    @author = User.create(name: 'Shahadat Hossain',
                          photo: 'https://images.unsplash.com/photo-1651684215020-f7a5b6610f23?&fit=crop&w=640',
                          bio: 'A skilled carpenter with over 15 years of experience, specializing ine.')
    @user = User.create(name: 'Rakibul Islam',
                        photo: 'https://images.unsplash.com/photo-1530268729831-4b0b9e170218?&fit=crop&w=640',
                        bio: 'A licensed therapist with expertise in cognitive-behavioral therapy and trauma-informed.')
    @post = Post.create(author: @author, title: 'First seed post', text: 'Lorem Ipsum is simple.')
    @post2 = Post.create(author: @author, title: 'Second seed post', text: 'Lorem Ipsum is simple2.')
    @post3 = Post.create(author: @author, title: 'Third seed post', text: 'Lorem Ipsum is simple3.')
    @comment = Comment.create(post: @post, user: @user, text: 'first comment')
    @comment2 = Comment.create(post: @post, user: @user, text: 'Sed auctor augue euismod est faucibus ultrices.')
    @comment3 = Comment.create(post: @post2, user: @user, text: 'Sed auctor augue euismod est faucibus ultrices.')
    @like = Like.create(post: @post, user: @user)
    visit user_posts_path(@author)
  end

  it 'should show user author picture' do
    expect(page).to have_selector("img[src*='#{@author.photo}']")
  end

  it 'should show the author name' do
    expect(page).to have_content(@author.name)
  end

  it 'should show user posts_counter' do
    expect(page).to have_content @author.posts_counter
  end

  it 'should show posts title' do
    expect(page).to have_content(@post.title)
    expect(page).to have_content(@post2.title)
    expect(page).to have_content(@post3.title)
  end

  it 'should show posts text' do
    expect(page).to have_content(@post.text)
    expect(page).to have_content(@post2.text)
    expect(page).to have_content(@post3.text)
  end

  it 'should show each post comments_counter' do
    expect(page).to have_content @post.comments_counter
    expect(page).to have_content @post2.comments_counter
    expect(page).to have_content @post3.comments_counter
  end

  it 'should show each post likes_counter' do
    expect(page).to have_content @post.likes_counter
    expect(page).to have_content @post2.likes_counter
    expect(page).to have_content @post3.likes_counter
  end

  it 'should show button for pagination' do
    expect(page).to have_content('Pagination')
  end

  it 'should redirect to specif post' do
    link = find("a[href='#{user_post_path(@post.author, @post)}']")
    link.click
    expect(page).to have_current_path(user_post_path(@post.author, @post))
  end
end
