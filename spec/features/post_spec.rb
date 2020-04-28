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
end

describe 'Creation' do
  before do
    user = User.create(
      email: "jdoe@example.com",
      password: "12345678",
      password_confirmation: "12345678",
      first_name: "John",
      last_name: "Doe"
    )
    login_as(user, scope: "user")
    visit new_post_path
  end

  describe 'Post#new' do
    it 'form can be reached' do
      expect(page.status_code).to eq(200)
    end
  end

  describe 'Post#create' do
    it 'works' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[reason]', with: "This is a reason"

      click_on "Save"

      expect(page).to have_content("This is a reason")
    end

    it 'will have an associated User' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[reason]', with: "User_Association"

      expect(User.last.posts.last.reason).to_eq("User_Association")
    end
  end
end
