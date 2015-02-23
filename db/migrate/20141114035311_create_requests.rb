class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :title
      t.string :client
      t.string :description
      t.string :status, :default => "進行中"
      t.boolean :interview, :default => false
      t.datetime :from
      t.datetime :to
      t.datetime :modify_at

      t.timestamps
    end
  end
end
