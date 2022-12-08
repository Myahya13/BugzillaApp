class CreateBug < ActiveRecord::Migration[6.0]
  def change
    create_table :bugs do |t|
      t.string :title
      t.text  :description
      t.string :priority
      t.string :Completiontime
      t.string :status

    end
  end
end
