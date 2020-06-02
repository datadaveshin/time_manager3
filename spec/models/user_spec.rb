require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = User.create(
      email: "test@example.com",
      password: "12345678",
      password_confirmation: "12345678",
      first_name: "John",
      last_name: "Doe"
    )
  end

  describe ".create" do

    it "works" do
      expect(@user).to be_valid
    end

    it "can't create without first_name" do
      @user.first_name = nil
      expect(@user.first_name).to be_falsey
    end

    it "can't create without last_name" do
      @user.last_name = nil
      expect(@user.last_name).to be_falsey
    end
  end

  describe "custom name methods" do
    it 'has a full name method that combines and first and last name' do
      expect(@user.full_name).to eq("DOE, JOHN")
    end
  end
end
