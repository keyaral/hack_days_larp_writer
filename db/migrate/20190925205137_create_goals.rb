class CreateGoals < ActiveRecord::Migration[5.2]
  def change
    create_table :goals do |t|
      t.string :name
      t.string :short_description
      t.string :long_description
      t.belongs_to :character

      t.timestamps
    end
  end
end
