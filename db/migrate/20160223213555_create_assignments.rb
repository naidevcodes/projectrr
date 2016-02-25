class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.integer :project_id
      t.integer :resource_id
      t.datetime :start_date
      t.datetime :end_date
      t.references :projects, index: true, foreign_key: true
      t.references :resources, index: true, foreign_key: true
      
      t.timestamps
    end
  end
end
