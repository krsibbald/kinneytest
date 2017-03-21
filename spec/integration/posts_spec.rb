require 'rails_helper'
feature 'posts' do 
  let!(:user){FactoryGirl.create(:user, first_name: 'Gaston', last_name: 'DeVillage')}

  scenario 'no way to add post' do
    visit posts_path
    refute(page.has_content?("+ New Post"))
  end

  describe 'logged in' do
    before :each do 
      login_as user
    end
    scenario 'when logged in can add post' do
      visit posts_path
      assert(page.has_content?("+ New Post"))

      click_on "+ New Post"
      expect(current_path).to eq new_post_path

      within("form#new_post") do
        fill_in 'Title', with: 'Expectorating'
        fill_in 'Body', with: 'In a spitting match nobody spits like Gaston!'
      end
      click_button 'Save'

      expect(page).to have_content 'Title: Expectorating by User: Gaston DeVillage'
    end
  end
end