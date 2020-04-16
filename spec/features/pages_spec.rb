require 'rails_helper'

describe 'navigate to' do
  describe 'home' do
    it 'can be reached successfully' do
      visit root_path
      expect(pages.status_code).to eq(200)
    end
  end
end
