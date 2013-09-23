FactoryGirl.define do
  factory :event do
    sequence(:name) { |e| "After Me" }
    sequence(:place) { |e| "Blimpie" }
  end
end
