class Branch
  
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Versioning
  include Mongoid::FullTextSearch
  
  max_versions 10
  paginates_per 10
  
  belongs_to :group
  
  field :code, :type => Integer
  field :name, :type => String
  field :nickname, :type => String
  field :insurance_type, :type => String
  field :description, :type => String
  
  fulltext_search_in :name, :nickname, :ngram_width => 5
  
  validates_uniqueness_of :code
  validates_uniqueness_of :name
  validates_uniqueness_of :nickname
  
  def full_name
    "#{self.name} (#{"%03d" % self.code})"
  end
  
  
end
