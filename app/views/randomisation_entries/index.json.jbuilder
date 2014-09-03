json.array!(@randomisation_entries) do |randomisation_entry|
  json.extract! randomisation_entry, :id, :object, :action, :randomisation_session_id
  json.url randomisation_entry_url(randomisation_entry, format: :json)
end
