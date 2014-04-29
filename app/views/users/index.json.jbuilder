json.array!(@users) do |user|
  json.extract! user, :id, :name, :surname, :email, :password_digest, :resettoken, :resettime, :language, :role
  json.url user_url(user, format: :json)
end
