require('pry')
require_relative('models/bounty')

bounty1 = Bounty.new({'name' => 'Garthak the Destroyer', 'species' => 'Reptowombat', 'value' => '1000', 'danger_level' => 'ermagerd'})

bounty1.save()
p bounty1
