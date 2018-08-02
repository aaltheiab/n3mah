class Order < ActiveRecord::Base

  before_validation :set_status
  STATUSES = %w(pending in_progress completed)
  belongs_to :user, optional: true
  belongs_to :owner, polymorphic: true



  def complete!
    self.status = 'completed'
    save
  end

  private

  # set default 'pending' status to order
  def set_status
    self.status ||= 'pending'
  end
end