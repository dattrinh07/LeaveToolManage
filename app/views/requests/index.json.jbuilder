json.array!(@requests) do |request|
  json.extract! request, :id, :leave_date, :comeback_date, :request_type, :description, :status_request
  json.url request_url(request, format: :json)
end
