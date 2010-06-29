class Account
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Versioning
  field :first_name, :type => String
  field :last_name, :type => String
  field :birthday, :type => Date
  embedded_in :user, :inverse_of => :account
end
