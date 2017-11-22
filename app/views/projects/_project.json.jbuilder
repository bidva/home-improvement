json.extract! project, :id, :name, :desc, :type, :estimated_effort, :actual_effort, :status, :created_at, :updated_at
json.url project_url(project, format: :json)
