class MemberInfo < ApplicationRecord
  belongs_to :user

  validates :name, presence: true, length: { maximum: 20 }
  validates :gender, presence: true
  validates :age, presence: true
  validates :weight, presence: true
  validates :height, presence: true

  enum gender: { man: 0, woman: 1 }

  # PFC量の計算
  def self.nutrient_calculator(member_info, current_user, shopping_list)
    return [ 0, 0, 0 ] if member_info.empty? || shopping_list.nil?
    # member_infoとshoppint_listから情報を取得
    number_of_member = current_user.member_info.count

    total_protein = []
    total_fat = []
    total_carbohydrate = []
    weights = []

    # 1日のエネルギー必要量を計算
    number_of_member.times do |i|
      weights << member_info[i].weight
      total_protein << weights[i] * 1.0
      total_fat << weights[i] * 1.0
      # 性別によって基礎代謝量を計算(男性:0, 女性:1)
      if member_info[i].gender == 0
        total_carbohydrate << weights[i] * 4.0
      else
        total_carbohydrate << weights[i] * 3.0
      end
    end
    total_protein_sum = total_protein.sum * shopping_list.stocking_days
    total_fat_sum = total_fat.sum * shopping_list.stocking_days
    total_carbohydrate_sum = total_carbohydrate.sum * shopping_list.stocking_days
    return total_protein_sum, total_fat_sum, total_carbohydrate_sum
  end
end
