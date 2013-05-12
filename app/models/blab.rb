class Blab < ActiveRecord::Base
  attr_accessible :text, :tags
  
  validates :text, presence: true
end
