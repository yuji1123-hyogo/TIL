json.extract! article, :id, :title, :date, :body, :created_at, :updated_at
json.url article_url(article, format: :json)
