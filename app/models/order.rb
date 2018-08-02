class Order < ActiveRecord::Base


  STATUSES = %w(pending in_progress complete)
  belongs_to :user, optional: true
  belongs_to :owner, polymorphic: true

end