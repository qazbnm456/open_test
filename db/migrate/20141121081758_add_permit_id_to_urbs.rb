class AddPermitIdToUrbs < ActiveRecord::Migration
  def change
    add_column :urbs, :permit_id, :integer
  end
end
