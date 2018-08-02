class Node < ActiveRecord::Base
  belongs_to :branch
  has_many :orders, as: :owner

  validates :capacity, presence: true

  before_validation :set_capacity


  private

  # set default capacity to 100 if not provided
  def set_capacity
    self.capacity ||= 100
  end
end