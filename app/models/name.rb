class Name
  include Mongoid::Document
  
  field :first, :type => String
  field :last, :type => String

  validates_presence_of :first, :last
  
end
