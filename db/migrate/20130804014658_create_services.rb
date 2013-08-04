class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :name
      t.string :icon
      t.text :embed_code

      t.timestamps
    end
  end
end
