require 'rails_helper'

feature 'Main' do
  context 'viewing home' do
    scenario 'viewers should see posts' do
      visit '/'
      expect(page).to have_content 'Home'
    end
  end
end
