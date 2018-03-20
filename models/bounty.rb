require('pg')
require('pry')

class Bounty

  attr_reader :name, :species, :value, :danger_level

  def initialize( options )
    @species = options['species']
    @value = options['value'].to_i
    @danger_level = options['danger_level']
    @name = options['name']
  end

  def save
    db = PG.connect( { dbname: 'bounty_hunter', host: 'localhost'} )

    sql = "INSERT INTO bounties (
    name, species, value, danger_level
  )
  VALUES ($1, $2, $3, $4)
  ;
  "
  values = [@name, @species, @value, @danger_level]
  db.prepare("save_it", sql)
  db.exec_prepared("save_it", values)

  db.close

  end

  # def Bounty.delete_all
  #   db = PG.connect
  # end

end
