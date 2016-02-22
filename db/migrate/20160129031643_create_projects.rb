class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.datetime :start_date
      t.datetime :projected_end_date
      t.datetime :actual_end_date
      t.decimal :budget, precision: 9, scale: 2
      t.decimal :cost, precision: 9, scale: 2
      
      t.timestamps
    end
  end
end

# always ADD t.timestamps
# changed datatype from float to decimal on budget and cost
# precision: digit limit
# scale: number of digits to the right of the dicimal point