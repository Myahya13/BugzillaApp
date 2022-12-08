class AddAssignTo < ActiveRecord::Migration[6.0]
  def change
    add_column :bugs, :assign_to, :bigint , index: true
  end
end
