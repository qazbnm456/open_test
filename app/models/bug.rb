class Bug < ActiveRecord::Base
  validates :title, :description, presence: true

  belongs_to :user
  belongs_to :request

  def not_current_user?(u)
    user != u
  end

end