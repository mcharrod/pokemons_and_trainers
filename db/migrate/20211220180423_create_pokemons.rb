class CreatePokemons < ActiveRecord::Migration[5.2]
  def change
    create_table :pokemons do |t|
      t.string :name
      t.integer :base_hp
      t.boolean :in_battle
      t.references :trainer, foreign_key: true

      t.timestamps
    end
  end
end
