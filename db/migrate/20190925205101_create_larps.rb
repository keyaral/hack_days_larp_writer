class CreateLarps < ActiveRecord::Migration[5.2]
  def change
    create_table :larps do |t|

      t.timestamps
    end
  end
end
