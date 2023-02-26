require "poke-api-v2"
require "json"
require "httparty"

Type.delete_all
Pokemon.delete_all
PokemonType.delete_all

types = PokeApi.get(:type)
pokemen = PokeApi.get(pokemon: { limit: 1500 })

puts "Inserting types..."
types.results.each do |t|
  type_request = HTTParty.get("https://pokeapi.co/api/v2/type/#{t.name}/")
  type_info = JSON.parse(type_request.body)

  type = Type.create(
    id:   type_info["id"],
    name: type_info["name"]
  )

  # if type&.valid?
  #   type_info["moves"].each do |m|
  #     move = PokeApi.get(move: m["name"])
  #     Move.find_or_create_by(
  #       id:      move.id,
  #       name:         move.name,
  #       accuracy:     move.accuracy,
  #       pp:           move.pp,
  #       power:        move.power,
  #       damage_class: move.damage_class.name,
  #       priority:     move.priority,
  #       move_type:    move.type.name,
  #       type_id:      type.id
  #     )
  #   end
  # end
end

puts "Inserting #{pokemen.results.count} pokemon..."
pokemen.results.each do |p|
  pokemon = PokeApi.get(pokemon: p.name)
  pokeman = Pokemon.find_or_create_by(
    id:              pokemon.id,
    name:            pokemon.name,
    height:          pokemon.height,
    weight:          pokemon.weight,
    sprite:          pokemon.sprites.front_default,
    hp:              pokemon.stats[0].base_stat,
    attack:          pokemon.stats[1].base_stat,
    defense:         pokemon.stats[2].base_stat,
    special_attack:  pokemon.stats[3].base_stat,
    special_defense: pokemon.stats[4].base_stat,
    speed:           pokemon.stats[5].base_stat,
    base_experience: pokemon.base_experience
  )

  if (pokeman&.valid?)
    pokemon.types.each do |type|
      PokemonType.create(
        pokemon_name: pokeman.name,
        type_name:    type.type.name
      )
    end
  end
end
