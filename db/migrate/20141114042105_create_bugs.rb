class CreateBugs < ActiveRecord::Migration
  def change
    create_table :bugs do |t|
      t.string :title
      t.string :description
      t.integer :level, :default => 0
      t.string :status, :default => "待審核"
      t.datetime :modify_at

      t.timestamps
    end
  end
end
