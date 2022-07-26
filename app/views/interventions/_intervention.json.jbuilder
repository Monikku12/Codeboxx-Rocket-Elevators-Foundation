json.extract! intervention, :id, :author, :customerID, :buildingID, :batteryID, :columnID, :elevatorID, :employeeID, :intervention_started_at, :intervention_ended_at, :result, :report, :status, :created_at, :updated_at
json.url intervention_url(intervention, format: :json)
