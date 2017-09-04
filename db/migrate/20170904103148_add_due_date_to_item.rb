class AddDueDateToItem < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :due_date, :date
  end
end
