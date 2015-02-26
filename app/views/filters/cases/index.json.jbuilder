json.array! @filtered_cases do |desk_case|
  json.id desk_case.id
  json.remote_updated_at desk_case.remote_updated_at
  json.subject desk_case.subject
  json.priority desk_case.priority
  json.description desk_case.description
  json.status desk_case.status
  json.label_names desk_case.labels.map(&:name).join(', ')
end