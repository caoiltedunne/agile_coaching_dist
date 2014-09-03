json.array!(@randomisation_sessions) do |randomisation_session|
  json.extract! randomisation_session, :id, :name
  json.url randomisation_session_url(randomisation_session, format: :json)
end
