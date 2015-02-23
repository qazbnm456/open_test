class AddTotalMoneyAndRemainingMoneyToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :total_money, :integer, :default => 0
    add_column :requests, :remaining_money, :integer, :default => 0
  end
end
