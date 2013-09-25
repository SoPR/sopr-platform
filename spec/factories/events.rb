FactoryGirl.define do
  factory :event do
    sequence(:name) { |e| "After Me #{e.next}" }
+   sequence(:place) { |e| "Blimpie #{e.next}" }
+   date Time.now
  end
end
