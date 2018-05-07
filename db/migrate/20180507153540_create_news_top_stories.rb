class CreateNewsTopStories < ActiveRecord::Migration[5.2]
  def change
    create_table :news_top_stories do |t|
      t.string :token
      t.string :source_id
      t.string :author
      t.string :title
      t.text :description
      t.string :story_url
      t.string :image_url
      t.datetime :published_at

      t.timestamps
    end
    add_index :news_top_stories, :token, unique: true
  end
end
