require('pg')
require('pry')

class Bounty

  attr_accessor :name, :species, :value, :danger_level
  attr_reader :id

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

  def update
    db = PG.connect( { dbname: 'bounty_hunter', host: 'localhost'} )

    sql = "
      UPDATE bounties
      SET (name, species, value, danger_level)
      = ($1, $2, $3, $4)
      WHERE id = $5
      ;
    "

    values = [@name, @species, @value, @danger_level, @id]

    db.prepare("update", sql)
    db.exec_prepared("update", values)
  end

  def Bounty.delete_all
    db = PG.connect( {dbname: 'bounty_hunter', host: 'localhost'} )

    sql = "DELETE FROM bounties;"

    db.prepare("delete all", sql)
    orders = db.exec_prepared("delete all")

    db.close()
  end

end
