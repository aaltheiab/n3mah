class Node < ActiveRecord::Base
  belongs_to :branch
  has_many :orders, as: :owner
end