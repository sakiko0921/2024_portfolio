class DailyNecessityItem < ApplicationRecord
  belongs_to :daily_necessity
  belongs_to :shopping_list
end
