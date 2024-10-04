require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:post) { FactoryBot.build(:post) }


  context 'Should not be valid' do
    it 'when title is not present' do
      post.title = nil
      expect(post).not_to be_valid
    end

    it 'when body is not present' do
      post.body = "test"
      expect(post).to be_valid
    end

    it 'when user id  is present' do
        post.user_id = '1'
        expect(post).to be_valid
    end 
  end

end
