require 'rails_helper'

RSpec.describe 'See mutual friends column' do
  before :each do
    @user1 = User.create(name: 'fry', email: 'test1@test.com', password: '123456')
    @user2 = User.create(name: 'john', email: 'test2@test.com', password: '123456')
    @user3 = User.create(name: 'bender', email: 'test3@test.com', password: '123456')
    @user1.friendships.create(confirmed: true, user_id: 1, friend_id: 2)
    @user3.friendships.create(confirmed: true, user_id: 3, friend_id: 2)
  end
  feature 'User can' do
    scenario 'send friend request  And cancel friend request successfully' do
      visit '/users/sign_in'
      fill_in 'Email', with: 'test1@test.com'
      fill_in 'Password', with: '123456'
      click_button 'Log in'
      visit '/users'
      expect(page).to have_content('Friends suggestions')
    end
  end
end
