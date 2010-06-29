# Read about factories at http://github.com/thoughtbot/factory_girl
Factory.sequence :email do |s|
  "test#{s}@example.com"
end

Factory.define :user do |u|
end
Factory.define :valid_user, :class => User do |u|
  u.email  { Factory.next(:email) }
  u.password  'testing123'
  u.password_confirmation  'testing123'
end
