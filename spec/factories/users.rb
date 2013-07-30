FactoryGirl.define do
  factory :user do
    sequence(:first_name) { |e| "John#{e.next}" }
    sequence(:last_name)  { |e| "Code#{e.next}" }
    sequence(:email)      { |e| "#{e.next}@gmail.com" }
    sequence(:username)   { |e| "DubstepKitten#{e.next}"}
    password Kernel.rand(6 ** 10)
    bio "I'm only a factory girl :("
  end
end