puts 'seeding...'
require 'securerandom'
def getRandomKey
    while true do
        key = SecureRandom.urlsafe_base64(4)
        return key if !Url.where(key: key).exists?
    end 
end
base_url = 'http://localhost:3000/go/'
# Users
User.create!(email: 'user1@email.com', password: '123456')
User.create!(email: 'user2@email.com', password: '123456')
User.create!(email: 'user3@email.com', password: '123456')

# Urls
  # User 1
    key = getRandomKey
    Url.create!(destination: 'https://www.google.com.br/',   user_id: 1, key: key, full_url: base_url+key)
    key = getRandomKey
    Url.create!(destination: 'https://www.twitter.com/home', user_id: 1, key: key, full_url: base_url+key)
    key = getRandomKey
    Url.create!(destination: 'https://www.facebook.com/',    user_id: 1, key: key, full_url: base_url+key)
  # User 2  
    key = getRandomKey
    Url.create!(destination: 'https://www.github.com/',      user_id: 2, key: key, full_url: base_url+key)
    key = getRandomKey
    Url.create!(destination: 'https://www.gmail.com/',       user_id: 2, key: key, full_url: base_url+key)
    key = getRandomKey
    Url.create!(destination: 'https://www.youtube.com/',     user_id: 2, key: key, full_url: base_url+key)
  # User 3
    key = getRandomKey
    Url.create!(destination: 'http://www.codeforces.com/',   user_id: 3, key: key, full_url: base_url+key)
    key = getRandomKey
    Url.create!(destination: 'http://www.netflix.com/',      user_id: 3, key: key, full_url: base_url+key)
    key = getRandomKey
    Url.create!(destination: 'https://www.heroku.com/',      user_id: 3, key: key, full_url: base_url+key)


puts 'seeding...ok'