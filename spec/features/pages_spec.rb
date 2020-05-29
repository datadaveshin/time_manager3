require 'rails_helper'

describe 'Navigation' do
  describe 'home#index' do
    it 'can be reached successfully' do
      visit root_path
      expect(page.status_code).to eq(200)
    end
  end
end
