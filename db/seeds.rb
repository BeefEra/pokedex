require "poke-api-v2"
require "json"
require "net/http"

Type.delete_all
Pokemon.delete_all
PokemonType.delete_all
Move.delete_all
PokemonMove.delete_all
Ability.delete_all
PokemonAbility.delete_all

types = PokeApi.get(:type)
pokemen = PokeApi.get(pokemon: { limit: 50 })
abilities = PokeApi.get(ability: { limit: 500 })

puts "Inserting #{types.count} types..."
types.results.each do |t|
  type_request = Net::HTTP.get(URI("https://pokeapi.co/api/v2/type/#{t.name}/"))
  type_info = JSON.parse(type_request)

  type = Type.create(
    id:   type_info["id"],
    name: type_info["name"]
  )

  if type&.valid?
    puts "Inserting #{type_info["moves"].count} #{type_info["name"]} type moves..."
    type_info["moves"].each do |m|
      move = PokeApi.get(move: m["name"])
      Move.find_or_create_by(
        id:           move.id,
        name:         move.name,
        accuracy:     move.accuracy,
        pp:           move.pp,
        power:        move.power,
        damage_class: move.damage_class.name,
        priority:     move.priority,
        move_type:    move.type.name,
        type_id:      type.id
      )
    end
  end
end

puts "Inserting #{abilities.count} abilities..."
abilities.results.each do |a|
  ability = PokeApi.get(ability: a.name)
  long_effect = "no description availbable"
  short_effect = "no description available"

  ability.effect_entries.each do |e|
    if e.language.name == "en"
      long_effect = e.effect
      short_effect = e.short_effect
    end
  end

  Ability.find_or_create_by(
    id:                ability.id,
    name:              ability.name,
    effect:            long_effect,
    short_description: short_effect
  )
end

puts "Inserting #{pokemen.count} pokemon..."
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

    pokemon.moves.each do |move|
      PokemonMove.create(
        pokemon_name: pokeman.name,
        move_name:    move.move.name
      )
    end

    pokemon.abilities.each do |ability|
      PokemonAbility.create(
        pokemon_name: pokeman.name,
        ability_name: ability.ability.name,
        hidden:       ability.is_hidden
      )
    end
  end
end
