class AddGenderToMemberInfo < ActiveRecord::Migration[7.2]
  def change
    add_column :member_infos, :gender, :integer, default: 0
  end
end
