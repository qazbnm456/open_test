class RemoveBugIdFromUrbs < ActiveRecord::Migration
  def change
    remove_column :urbs, :bug_id
  end
end
