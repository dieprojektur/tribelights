class PublicProfile
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, :type => String
  field :birthday, :type => Date
  referenced_in :profile
end
