class Kind < ActiveRecord::Base

  # Validations
  validates_presence_of :description

  # Scopes
  scope :order_by_description, -> { order(:description) }

end
