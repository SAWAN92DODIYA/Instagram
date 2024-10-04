require 'rails_helper'

RSpec.describe SavedPost, type: :model do
  let(:saved_posts) { FactoryBot.build(:saved_posts) }
  
  context 'Should validate' do
    it 'with post id present' do
        saved_posts.post_id = 2
      expect(saved_posts).to be_valid
    end

    it 'when user id  is not present' do
        saved_posts.user_id = 1
      expect(saved_posts).not_to be_valid
    end
  end

end 