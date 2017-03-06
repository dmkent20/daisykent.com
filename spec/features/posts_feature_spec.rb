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

    scenario 'prompts admin to fill out a form, then displays new post' do
      visit '/posts'
      click_link 'Create new post'
      fill_in 'Title', with: 'Gucci Bag'
      click_button 'Post!'
      expect(page).to have_content 'Gucci Bag'
      expect(current_path).to eq '/posts'
    end
  end

  context 'posts have been created' do

    before do
      Post.create(title: 'Shoes')
    end

    scenario 'display posts' do
      visit '/posts'
      expect(page).to have_content('Shoes')
      expect(page).not_to have_content('Time to write your first post :D')
    end
  end

  context 'viewing posts' do

    let!(:gucci){ Post.create(title:'Gucci Bag') }

    scenario 'lets admin view full post' do
      visit '/posts'
      click_link 'Review'
      expect(page).to have_content 'Gucci Bag'
      expect(current_path).to eq "/posts/#{gucci.id}"
    end
  end

  context 'editing posts' do

    before { Post.create title: 'Gucci Bag', content: 'So pretty', id: 1 }

    scenario 'lets admin edit a post' do
      visit '/posts'
      click_link 'Edit'
      fill_in 'Title', with: 'Suede Gucci Bag'
      fill_in 'Content', with: 'So beautiful but costs $$$'
      click_button 'Update Post'
      expect(current_path).to eq '/posts/1'
      expect(page).to have_content 'Suede Gucci Bag'
      expect(page).to have_content 'So beautiful but costs $$$'
    end
  end
end
