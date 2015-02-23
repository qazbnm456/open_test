class AddUserIdAndRequestIdToBugs < ActiveRecord::Migration
  def change
    add_column :bugs, :user_id, :integer
    add_column :bugs, :request_id, :integer
  end
end
