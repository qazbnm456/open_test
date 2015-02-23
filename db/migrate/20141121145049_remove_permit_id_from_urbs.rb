class RemovePermitIdFromUrbs < ActiveRecord::Migration
  def change
    remove_column :urbs, :permit_id
  end
end
