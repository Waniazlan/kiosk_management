json.extract! supplier, :id, :supplier_name, :person_in_charge, :contact_number, :address, :created_at, :updated_at
json.url supplier_url(supplier, format: :json)
