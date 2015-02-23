class CreatePermits < ActiveRecord::Migration
  def change
    create_table :permits do |t|
      t.string :status
    end
  end
end
