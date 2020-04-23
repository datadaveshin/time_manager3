require 'rails_helper'

RSpec.describe User, type: :model do
  describe ".User" do
    it "#create" do
      user = User.create(email: "test@example.com", password: "qwerty", password_confirmation: "qwerty")
      expect(user).to be_valid
    end
  end

  after(:all) { User.destroy_all }
end
