class RemoveProjectTypeFromProjects < ActiveRecord::Migration[5.1]
  def change
    remove_column :projects, :project_type, :text
  end
end
