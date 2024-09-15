class MemberInfo < ApplicationRecord
  belongs_to :user

  validates :name, presence: true, length: { maximum: 20 }
  validates :gender, presence: true
  validates :age, presence: true
  validates :weight, presence: true
  validates :height, presence: true

  enum gender: { man: 0, woman: 1 }
end
