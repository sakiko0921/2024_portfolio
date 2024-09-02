class User < ApplicationRecord
  authenticates_with_sorcery!

  # ユーザー登録のバリデーション
  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true, length: { maximum: 20 }

  # ユーザー情報の関連付け(お買い物リスト、ユーザーのメンバー登録情報)
  has_many :shopping_lists, dependent: :destroy
  has_many :member_infos, dependent: :destroy
end
