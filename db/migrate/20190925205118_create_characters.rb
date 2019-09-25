class CreateCharacters < ActiveRecord::Migration[5.2]
  def change
    create_table :characters do |t|
      t.string :name
      t.string :short_description
      t.string :long_description
      t.belongs_to :larp

      t.timestamps
    end
  end
end
