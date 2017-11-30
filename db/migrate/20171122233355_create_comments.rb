class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string :text
      t.datetime :created_at
      t.belongs_to :project, foreign_key: true
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
