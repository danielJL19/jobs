json.extract! job, :id, :name, :description, :user_id, :created_at, :updated_at
json.url job_url(job, format: :json)
