# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event do
    name "MyString"
    where "MyString"
    start_time "2013-09-18 03:08:58"
    url "MyString"
    image "MyString"
    user nil
  end
end
