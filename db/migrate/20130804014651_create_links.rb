class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :title
      t.string :url
      t.references :service
      t.references :tag

      t.timestamps
    end
    add_index :links, :service_id
    add_index :links, :tag_id
  end
end
