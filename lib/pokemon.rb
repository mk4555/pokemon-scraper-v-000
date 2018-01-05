class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  def initialize(id:, name:, type:, db:, hp: nil)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?,?)", name, type)
  end

  def self.find(id, db)
      row = db.execute("SELECT * FROM pokemon WHERE id=?", id).first
      pokemon = Pokemon.new(id: row[0], name: row[1], type: row[2], db: db )
  end

  def alter_pokemon(new_hp)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_hp, id)
  end

  def alter_hp(new_hp, id_num)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_hp, id)
  end


end
