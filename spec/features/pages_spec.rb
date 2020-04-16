require 'rails_helper'

describe 'navigate to' do
  describe 'home' do
    it 'can be reached successfully' do
      visit_root_path
      expect(page.status_code).to eq(200)
    end
  end
end
