require 'rails_helper'

feature "Categories" do
  before do
    admin_sign_in
  end

  context 'Creating a post with categories.' do
    # rspec will not recognise format.js and selenium refuses to work
    # scenario 'Creating a category.', js: true do
    #   visit new_post_path
    #   fill_in :category_name, with: 'Kawaii'
    #   click_on 'Create Category'
    #   expect(current_path).to eq new_post_path
    #   expect(page).to have_content "Kawaii"
    # end
    before do
      Category.create(name: "Lifestyle", created_from: "posts", creator_id: "1", id: '1')
    end
    scenario 'displays a list of categories when creating a post' do
      visit new_post_path
      expect(page).to have_css 'ul'
      expect(page).to have_content 'Lifestyle'
    end
    before do
      visit new_post_path
      fill_in :post_title, with: "Cycling"
      fill_in :post_content, with: "Beautiful day to cycle"
      find(:css, "#1").set(true)
      click_on 'Submit Post'
    end
    scenario 'Admin can assign a category to a post' do
      expect(page).to have_content "Lifestyle"
    end
    scenario 'Admin can unassign a category when editing' do
      visit posts_path
      click_link "Edit"
      find(:css, "#1").set(false)
      click_on "Update Post"
      expect(page).not_to have_content "Lifestyle"
    end
  end

  context 'Creating a video with categories.' do
    before do
      Category.create(name: "Lifestyle", created_from: "posts", creator_id: "1", id: '2')
    end
    scenario 'displays a list of categories when creating a video' do
      visit new_post_path
      expect(page).to have_css 'ul'
      expect(page).to have_content 'Lifestyle'
    end
    before do
      visit new_video_path
      fill_in :video_ytlink, with: "doesntmatter"
      fill_in :video_title, with: "Diet"
      fill_in :video_description, with: "Doesn't matter what you eat"
      find(:css, "#video_category_ids_[value='2']").set(true)
      click_on "Submit Video"
    end
    scenario 'Admin can assign a category to a video' do
      visit videos_path
      expect(page).to have_content "Lifestyle"
    end
    before do
      visit videos_path
      click_link "Edit"
      find(:css, "#video_category_ids_[value='2']").set(true)
      click_on "Update Video"
    end
    scenario 'Admin can unassign a category when editing' do
      visit videos_path
      click_link "Edit"
      find(:css, "#video_category_ids_[value='2']").set(false)
      click_on "Update Video"
      expect(page).not_to have_content "Lifestyle"
    end
  end

  context 'Deleting categories' do
    before do
      Category.create(name: "Lifestyle", created_from: "videos")
      Category.create(name: "Typo", created_from: "posts")
      Video.create(ytlink: "Spelling", title: "Writing", description: "Typos are a coders worst enemy")
    end
    # scenario 'Admin can delete a category' do
    #   visit videos_path
    #   click_link "Edit"
    #   within :css, "div#Typo" do
    #     click_link "x"
    #   end
    #   expect(page).not_to have_content "Typo"
    # end
  end
end
