require 'rails_helper'

describe 'Navigation' do
  before do
    @user = FactoryBot.create(:user)
    login_as(@user, :scope => :user)
  end

  describe 'index' do
    before do
      visit posts_path
    end

    it 'can be reached successfully' do
      expect(page.status_code).to eq(200)
    end

    it 'has Post title' do
      expect(page).to have_content(/Posts/)
    end

    it 'has a list of posts' do
      post1 = FactoryBot.create(:post)
      post2 = FactoryBot.create(:second_post)
      visit posts_path
      expect(page).to have_content(/First|Second/)
    end
  end

  describe 'creation' do
    describe 'Post#new' do
      before do
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
  end

  describe 'edit' do
    before do
      @post = FactoryBot.create(:post)
    end

    it 'can be reached by clicking edit on the index page' do
      visit posts_path

      click_link "edit_#{@post.id}"
      expect(page.status_code).to eq(200)
    end

    it 'can be edited' do
      visit edit_post_path(@post)

      fill_in 'post[date]', with: Date.today
      fill_in 'post[reason]', with: "Made reason edits"
      click_on "Save"

      expect(page).to have_content("Made reason edits")
    end
  end
end
