# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Deck.create([{name: 'deck1'}, {name: 'deck2'}])
Card.create([{front: 'front1', back: 'back1', deck_id: 1},
  {front: 'front2', back: 'back2', deck_id: 1},
  {front: 'front3', back: 'back3', deck_id: 2},
  {front: 'front4', back: 'back4', deck_id: 2}]
  )
