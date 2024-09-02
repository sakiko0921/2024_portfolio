class AddColumnToMemberInfo < ActiveRecord::Migration[7.2]
  def change
    add_column :member_infos, :gender, :integer, null: false, default: 0
  end
end
