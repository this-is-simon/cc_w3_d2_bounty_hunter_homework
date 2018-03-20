class Bounty
  attr_reader :name, :species, :value, :danger_level

  def initialize( options )
    @name = options['name'],
    @species = options['species'],
    @value = options['value'].to_i,
    @danger_level = options['danger_level']
  end

  def save
    sql = "INSERT INTO bounties (
    name, species, value, danger_level
  )
  VALUES (
    $1, $2, $3, $4
  )
  ";
  end

end
