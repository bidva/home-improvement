class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string :name
      t.text :desc
      t.text :type
      t.decimal :estimated_effort
      t.decimal :actual_effort
      t.text :status

      t.timestamps
    end
  end
end
