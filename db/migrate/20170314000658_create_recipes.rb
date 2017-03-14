class CreateRecipes < ActiveRecord::Migration[5.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :string
      t.string :ingredients
      t.string :string
      t.string :duration
      t.string :string
      t.string :author
      t.string :string

      t.timestamps
    end
  end
end
