require 'rails_helper'
require_relative './feature_helper'

feature 'videos' do

  context 'admin area should be inaccessible to public' do
    scenario 'user should be denied access to videos editor' do
      visit '/admin/videos'
      expect(current_path).to eq '/admins/sign_in'
      expect(page).to have_content 'Hey you! You need admin access to continue.'
    end
  end


  context 'no videos have been added' do
    scenario 'should display a prompt to add a video' do
      admin_sign_in
      visit '/admin/videos'
      expect(page).to have_content 'Time to upload your first video :D'
    end
  end

  context 'creating a new video' do
    scenario 'there should be a link to create a new video' do
      admin_sign_in
      visit '/admin/videos'
      expect(page).to have_link 'Create new video'
    end

    scenario 'prompts admin to fill out a form, then displays new video' do
      admin_sign_in
      visit '/admin/videos'
      click_link 'Create new video'
      fill_in 'Title', with: 'Gucci Bag'
      click_button 'Post!'
      expect(page).to have_content 'Gucci Bag'
      expect(current_path).to eq '/admin/videos'
    end
  end

  context 'videos have been created' do

    before do
      Video.create(title: 'Shoes')
    end

    scenario 'display videos' do
      admin_sign_in
      visit '/admin/videos'
      expect(page).to have_content('Shoes')
      expect(page).not_to have_content('Time to write your first video :D')
    end
  end

  context 'viewing videos' do

    let!(:gucci){ Video.create(title:'Gucci Bag') }

    scenario 'lets admin view full video' do
      admin_sign_in
      visit '/admin/videos'
      click_link 'Review'
      expect(page).to have_content 'Gucci Bag'
      expect(current_path).to eq "/admin/videos/#{gucci.id}"
    end
  end

  context 'editing videos' do

    before { Video.create title: 'Gucci Bag', description: 'So pretty', id: 1 }

    scenario 'lets admin edit a video' do
      admin_sign_in
      visit '/admin/videos'
      click_link 'Edit'
      fill_in 'Title', with: 'Suede Gucci Bag'
      fill_in 'Description', with: 'So beautiful but costs $$$'
      click_button 'Update Video'
      expect(current_path).to eq '/admin/videos/1'
      expect(page).to have_content 'Suede Gucci Bag'
      expect(page).to have_content 'So beautiful but costs $$$'
    end
  end

  context 'deleting videos' do

    before { Video.create title: 'Hello Kitty', description: 'So cute' }

    scenario 'admin can remove a video' do
      admin_sign_in
      visit '/admin/videos'
      click_link 'Remove'
      expect(page).not_to have_content 'Hello Kitty'
      expect(page).to have_content 'Video successfully removed'
    end
  end
end
