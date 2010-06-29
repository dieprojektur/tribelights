# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :user do |f|
  f.login "MyString"
  f.email "MyString"
  f.crypted_password "MyString"
  f.password_salt ""
  f.persistence_token "MyString"
  f.single_access_token "MyString"
  f.perishable_token "MyString"
  f.login_count 1
  f.failed_login_count 1
  f.last_request_at "2010-06-23 19:32:07"
  f.current_login_at "2010-06-23 19:32:07"
  f.last_login_at "2010-06-23 19:32:07"
  f.current_login_ip "MyString"
  f.last_login_ip "MyString"
end
