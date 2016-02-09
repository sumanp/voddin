json.array!(@projects) do |project|
  json.extract! project, :id, :title, :description, :category
  json.url project_url(project, format: :json)
end
