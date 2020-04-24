require 'rails_helper'

RSpec.describe User, type: :model do
  describe ".create" do
    before do
      @user = User.create(
        email: "test@example.com",
        password: "qwerty",
        password_confirmation: "qwerty",
        first_name: "John",
        last_name: "Doe"
      )
    end

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

  after(:all) { User.destroy_all }
end
