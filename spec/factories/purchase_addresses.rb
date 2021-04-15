FactoryBot.define do
  factory :purchase_address do
    postal_code { '245-0021' }
    area_id { 3 }
    municipality { '横浜市緑区' }
    address { '青山1-1-1 ' }
    building { '柳ビル202 ' }
    phone_number { '09012345678' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
