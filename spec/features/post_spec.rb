require 'rails_helper'

describe 'Navigation' do
  describe 'Post#index' do
    it 'can be reached successfully' do
      visit posts_path
      expect(page.status_code).to eq(200)
    end

    it 'has Post title' do
      visit posts_path
      expect(page).to have_content(/Posts/)
    end
  end

  describe 'Post#new' do
    it 'form can be reached' do
      visit new_post_path
      expect(page.status_code).to eq(200)
    end
  end

  describe 'Post#create' do
    it 'works' do
      visit new_post_path
      fill_in 'post[date]', with: Date.today
      fill_in 'post[reason]', with: "This is a reason"

      click_on "Save"

      expect(page).to have_content("This is a reason")
    end
  end
end
