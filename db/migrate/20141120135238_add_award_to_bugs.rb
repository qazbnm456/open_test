class AddAwardToBugs < ActiveRecord::Migration
  def change
    add_column :bugs, :award, :integer, :default => 0
  end
end
