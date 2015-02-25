json.extract! desk_case, 
  :id,
  :remote_updated_at,
  :subject,
  :priority,
  :description,
  :status

json.message do
  json.extract! desk_case.message,
    :remote_created_at,
    :body
end

json.labels desk_case.labels, :id, :name