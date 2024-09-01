class AddColumnWeightAndHeightToMemberInfos < ActiveRecord::Migration[7.2]
  def change
    add_column :member_infos, :weight, :integer, null: false
    add_column :member_infos, :height, :integer, null: false
  end
end
