json.extract! letter, :id, :name, :content, :to, :from, :cc, :bcc, :template, :email, :sent, :created_at, :updated_at
json.url letter_url(letter, format: :json)
