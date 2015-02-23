class Urb < ActiveRecord::Base

  belongs_to :user
  belongs_to :request
  belongs_to :permit
end