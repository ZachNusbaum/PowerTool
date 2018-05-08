class CreateNewsSources < ActiveRecord::Migration[5.2]
  def change
    create_table :news_sources do |t|
      t.string :source_id
      t.string :name
      t.text :description
      t.string :url
      t.string :category
      t.string :language
      t.string :country
      t.string :token

      t.timestamps
    end
    add_index :news_sources, :token, unique: true
    add_index :news_sources, :source_id, unique: true
  end
end
