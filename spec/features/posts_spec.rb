require 'rails_helper'

RSpec.describe 'Test to verify if the user only sees friends posts' do
  before :each do
    @user1 = User.create(name: 'fry', email: 'test1@test.com', password: '123456', id: '1')
    @user2 = User.create(name: 'bender', email: 'test2@test.com', password: '123456', id: '2')
    @user2 = User.create(name: 'leela', email: 'test3@test.com', password: '123456', id: '3')
    @user1.friendships.create(confirmed: true, user_id: 1, friend_id: 2)
    Post.create(user_id: 2, content: 'Bender Post')
    Post.create(user_id: 3, content: 'Leela Post')
  end
  feature 'User can see only his friend post' do
    scenario 'sign in and go to post index' do
      visit '/users/sign_in'
      fill_in 'Email', with: 'test1@test.com'
      fill_in 'Password', with: '123456'
      click_button 'Log in'
      visit '/posts'
      expect(page).to have_content('Bender Post')
      expect(page).to have_no_content('Leela Post')
    end
  end
end
