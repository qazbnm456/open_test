class CreateUrbs < ActiveRecord::Migration
  def change
    create_table :urbs do |t|
      t.integer :user_id
      t.integer :request_id
      t.integer :bug_id
    end
  end
end
