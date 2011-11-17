class Product
  
  include Mongoid::Document
  
  field :code, :type => Integer
  field :name, :type => String
  
  has_and_belongs_to_many :branches
  
end
