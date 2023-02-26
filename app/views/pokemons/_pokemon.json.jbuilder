json.extract! pokemon, :id, :id, :name, :height, :weight, :sprite, :hp, :attack, :defense, :special_attack, :special_defense, :speed, :base_experience, :created_at, :updated_at
json.url pokemon_url(pokemon, format: :json)
