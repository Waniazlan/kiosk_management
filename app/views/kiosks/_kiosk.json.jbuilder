json.extract! kiosk, :id, :name, :location, :address,  :created_at, :updated_at
json.url kiosk_url(kiosk, format: :json)
