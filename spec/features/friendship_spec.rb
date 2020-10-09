require 'rails_helper'
require 'spec_helper'

RSpec.describe 'Testing friend request send, cancel invite' do
  before :each do
    @user1 = User.create(name: 'fry', email: 'test1@test.com', password: '123456')
    @user2 = User.create(name: 'john', email: 'test2@test.com', password: '123456', id: '7')
  end
  feature 'User can' do
    scenario 'send friend request  And cancel friend request successfully' do
      visit '/users/sign_in'
      fill_in 'Email', with: 'test1@test.com'
      fill_in 'Password', with: '123456'
      click_button 'Log in'
      visit '/users'
      click_on 'Add Friend'
      expect(page).to have_content('Friendship request was sent successfully.')
      click_on 'Cancel Invite'
      expect(page).to have_content('Friendship was rejected')
    end
  end

  feature 'User can' do
    scenario 'sign out successfully' do
      visit '/users/sign_in'
      fill_in 'Email', with: 'test1@test.com'
      fill_in 'Password', with: '123456'
      click_button 'Log in'
      click_on 'Sign out'
      expect(page).to have_content('You need to sign in or sign up before continuing.')
    end
  end

  feature 'User can' do
    scenario 'visit profile' do
      visit '/users/sign_in'
      fill_in 'Email', with: 'test2@test.com'
      fill_in 'Password', with: '123456'
      click_button 'Log in'
      visit '/users/7'
      expect(page).to have_content('Friends')
    end
  end
end
