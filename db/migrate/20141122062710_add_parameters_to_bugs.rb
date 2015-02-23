class AddParametersToBugs < ActiveRecord::Migration
  def change
    add_column :bugs, :parameter_1, :string
    add_column :bugs, :parameter_2, :string
    add_column :bugs, :parameter_3, :string
  end
end
