json.extract! author, :id, :user_id, :name, :birth, :address, :photo, :created_at, :updated_at
json.url author_url(author, format: :json)
json.photo url_for(author.photo)

