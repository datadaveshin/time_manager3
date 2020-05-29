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

User.destroy_all
describe 'Creation' do
  describe 'Post#new' do
    before do
      User.destroy_all # NOTE DSS REMOVE ME LATER
      user = User.create!(
        email: "jdoe@example.com",
        password: "12345678",
        password_confirmation: "12345678",
        first_name: "John",
        last_name: "Doe"
      )

      login_as(user, :scope => :user)
      visit new_post_path
    end

    it 'form can be reached' do
      expect(page.status_code).to eq(200)
    end

    it 'works' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[reason]', with: "This is a reason"
      click_on "Save"

      expect(page).to have_content("This is a reason")
    end

    it 'will have an associated User' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[reason]', with: "User Association"
      click_on "Save"

      expect(User.last.posts.last.reason).to eq("User Association")
    end
  end
  # after(:all) { User.destroy_all } # NOTE DSS REMOVE ME LATER
end
