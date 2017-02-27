require 'rails_helper'

feature 'posts' do
  context 'no posts have been added' do
    scenario 'should display a prompt to add a post' do
      visit '/'
      expect(page).to have_content 'Time to write your first post :D'
    end
  end
end
