FactoryBot.define do
    factory :post do
      title { 'text title'}
      body { 'test body' }
      user_id {1 }
      
    end
  end