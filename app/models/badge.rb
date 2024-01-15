class Badge < ApplicationRecord
  RULES = %i[attempt? category? level?].freeze

  mount_uploader :image, ImageUploader

  has_many :user_badges, dependent: :destroy
  has_many :user, through: :user_badges

  validates :title, :rule_value, :rule_name, presence: true

  scope :by_rule_name, ->(name) { where(rule_name: name) }
  scope :by_rule_value, ->(name) { where(rule_value: name) }
  
end
