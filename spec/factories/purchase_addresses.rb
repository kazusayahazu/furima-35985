FactoryBot.define do
  factory :purchase_address do
    token { 'tok_abcdefghijk00000000000000000' }
    postal_code { '123-4567' }
    shipment_source_id { 2 }
    municipalities { '横浜市緑区' }
    address { '青山1-1-1' }
    building_name { '東京ハイツ' }
    telephone_number { '0123456789' }
  end
end
