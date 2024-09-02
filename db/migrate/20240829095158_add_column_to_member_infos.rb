class AddColumnToMemberInfos < ActiveRecord::Migration[7.2]
  def change
    add_column :member_infos, :name, :string, null: false
    add_column :member_infos, :gender, :string, null: false
    add_column :member_infos, :age, :string, null: false
    add_reference :member_infos, :user, null: false, foreign_key: true
  end
end
