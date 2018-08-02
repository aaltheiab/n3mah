class Order < ActiveRecord::Base

  before_validation :set_status
  STATUSES = %w(pending in_progress complete)
  belongs_to :user, optional: true
  belongs_to :owner, polymorphic: true



  private

  # set default 'pending' status to order
  def set_status
    self.status ||= 'pending'
  end
end