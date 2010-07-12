# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :profile do |p|
  p.name { Factory(:name) }
  p.birthday '1977-02-04'
end

Factory.define :empty_profile, :class => Profile do |p|
end
