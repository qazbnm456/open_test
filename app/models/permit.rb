class Permit < ActiveRecord::Base
  validates :status, presence: true

  has_many :urbs
  has_many :users, :through => :urbs
  has_many :requests, :through => :urbs

end