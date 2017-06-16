class Ad < ActiveRecord::Base

  belongs_to :member
  belongs_to :kind
  belongs_to :brand
  belongs_to :model

  # Validates
  validates_presence_of :brand, :model, :kind, :price, :picture

  # Scopes
  scope :descending_order, ->(quantity = 10) { limit(quantity).order(created_at: :desc) }
  scope :to_the, ->(member) { where(member: member) }
  scope :where_kind, ->(id) { where(kind: id) }

  # paperclip
  has_attached_file :picture, styles: { large: "800x300#", medium: "320x150#", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/

  # gem money-rails
  monetize :price_cents

end
