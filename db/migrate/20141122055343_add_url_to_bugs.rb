class AddUrlToBugs < ActiveRecord::Migration
  def change
    add_column :bugs, :url, :string
  end
end
