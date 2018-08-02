class Branch < ActiveRecord::Base
  belongs_to :center
  has_many :orders, as: :owner
end