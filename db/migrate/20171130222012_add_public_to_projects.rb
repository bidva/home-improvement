class AddPublicToProjects < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :public, :bool
  end
end
