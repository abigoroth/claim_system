json.extract! staff, :id, :name, :position, :email, :phone, :password, :created_at, :updated_at
json.url staff_url(staff, format: :json)
