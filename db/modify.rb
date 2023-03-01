require "json"
require "net/http"
require "poke-api-v2"

# Add effect description to moves table
moves = PokeApi.get(move: { limit: 1500 })

moves.results.each do |m|
  move = JSON.parse(Net::HTTP.get(URI(m.url)))
  entry = Move.find_by_id(move["id"])
  if entry
    entry.update(effect: move["effect_entries"][0]["effect"]) rescue false
    puts "Updated #{move['name']}"
  end
end
