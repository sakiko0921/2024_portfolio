class RemoveColumnFromMemberInfo < ActiveRecord::Migration[7.2]
  def change
    remove_column :member_infos, :gender
  end
end
