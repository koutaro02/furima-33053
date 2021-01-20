FactoryBot.define do
  factory :buyer_address do
    postcode { '123-4567' }
    prefecture_id { 1 }
    city { '名古屋市' }
    block { '中区1-1' }
    building { 'オアシス' }
    phone_number { '09012345678' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
