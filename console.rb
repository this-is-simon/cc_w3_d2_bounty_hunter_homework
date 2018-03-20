require('pry')
require_relative('models/bounty')

options_hash1 = {'name' => 'Garthak the Destroyer', 'species' => 'Reptowombat', 'value' => '1000', 'danger_level' => 'ermagerd'}

options_hash2 = {
  'name' => 'Nebuchadnezzar',
  'species' => 'Humanoid',
  'value' => '2000',
  'danger_level' => 'low'
}

options_hash3 = {
  'name' => 'Death Lobster',
  'species' => 'Fictionoid',
  'value' => '3000',
  'danger_level' => 'medium'
}

bounty1 = Bounty.new(options_hash1)
bounty2 = Bounty.new(options_hash2)
bounty3 = Bounty.new(options_hash3)

Bounty.delete_all()

bounty1.save()
bounty2.save()
bounty3.save()

p Bounty.all
