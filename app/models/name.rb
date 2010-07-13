class Name
  include Mongoid::Document
  
  field :first, :type => String
  field :last, :type => String

  embedded_in :profile, :inverse_of => :name
  validates_presence_of :first, :last

  def full
    self.first + ' ' + self.last
  end
  
end
