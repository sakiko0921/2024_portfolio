class DailyNecessity < ApplicationRecord
  belongs_to :user
  has_many :daily_necessity_items, dependent: :destroy
end
