# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :account do |f|
  f.first_name "MyString"
  f.last_name "MyString"
  f.birthday "2010-06-29"
end
