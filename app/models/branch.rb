class Branch < ActiveRecord::Base
  belongs_to :center
  has_many :orders, as: :owner
  has_many :users
  has_many :nodes
end