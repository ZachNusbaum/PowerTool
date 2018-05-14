class CreateNewsBookmarks < ActiveRecord::Migration[5.2]
  def change
    create_table :news_bookmarks do |t|
      t.references :user, foreign_key: true
      t.references :top_story, foreign_key: false

      t.timestamps
    end
    add_foreign_key :news_bookmarks, :news_top_stories, column: 'top_story_id'
  end
end
