class Group
  
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Versioning
  
  max_versions 50
  
  field :code, :type => Integer
  field :name, :type => String
  field :category, :type => String
  has_many :branches
  
end
