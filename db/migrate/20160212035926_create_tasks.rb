class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer :project_id
      t.string :name
      t.datetime :due_date
      t.references :projects, index: true, foreign_key: true
      
      t.timestamps
    end
  end
end
