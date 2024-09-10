class DailyNecessityItem < ApplicationRecord
  belongs_to :daily_necessity
  belongs_to :shopping_list

  enum unit: { g: 0, ml: 1, 個: 2 }
end
