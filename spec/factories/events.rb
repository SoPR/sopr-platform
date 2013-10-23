# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event do
    name "MyString"
    place "MyString"
    date "2013-10-23 11:44:15"
    image "MyString"
    url "MyString"
    user nil
  end
end
