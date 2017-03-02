require 'rails_helper'

feature 'posts' do
  context 'no posts have been added' do
    scenario 'should display a prompt to add a post' do
      visit '/posts'
      expect(page).to have_content 'Time to write your first post :D'
    end
  end
  context 'creating a new post' do
    scenario 'there should be a link to create a new post' do
      visit '/posts'
      expect(page).to have_link 'Create new post'
    end
  end
end
