class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :name, presence: true

  has_many :urbs
  has_many :requests, :through => :urbs
  has_many :permits, :through => :urbs
  has_many :bugs

  def enroll?(rid)
    requests.find_by_id(rid)
  end

  def request_permit?(rid)
    permits.select{|p| p.status == "審核通過"}.select{|p| p.requests.first.id == rid}.present?
  end

end
