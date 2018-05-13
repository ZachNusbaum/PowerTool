class AddBatchTokenToNewsTopStories < ActiveRecord::Migration[5.2]
  def change
    add_column :news_top_stories, :batch_token, :string
  end
end
