class AddDailyNewsBoolToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :send_daily_stories, :boolean, null: false, default: false
  end
end
