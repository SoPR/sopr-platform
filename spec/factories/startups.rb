FactoryGirl.define do
  factory :startup do
    sequence(:name) { |e| "Malanga Computers #{e.next}" }
    pitch 'Think Backwards'
  end
end