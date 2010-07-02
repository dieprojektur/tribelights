class Profile
  include Mongoid::Document
  include Mongoid::Versioning
  field :birthday, :type => Date
  embeds_one :name
  referenced_in :user
  validates_presence_of :user
end
