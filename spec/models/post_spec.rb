require 'rails_helper'

RSpec.describe Post, type: :model do
  describe ".create" do
    before do
      @post = Post.create(date: Date.today, reason: "shipment late")
    end

    it "works" do
      expect(@post).to be_valid
    end

    it "cannot be done without a date" do
      @post.date = nil
      expect(@post.date).to be_falsey
    end

    it "cannot be done without a reason" do
      @post.reason = nil
      expect(@post.reason).to be_falsey
    end
  end
  after (:all) {Post.destroy_all}
end
