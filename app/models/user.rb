class User
  include Mongoid::Document
  include Mongoid::Timestamps
  field :login, :type => String
  field :email, :type => String
  field :crypted_password, :type => String
  field :password_salt, :type => String,
  field :persistence_token, :type => String
  field :single_access_token, :type => String
  field :perishable_token, :type => String
  field :login_count, :type => Integer
  field :failed_login_count, :type => Integer
  field :last_request_at, :type => Time
  field :current_login_at, :type => Time
  field :last_login_at, :type => Time
  field :current_login_ip, :type => String
  field :last_login_ip, :type => String
end
