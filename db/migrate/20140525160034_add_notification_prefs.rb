class AddNotificationPrefs < ActiveRecord::Migration
  def change
    add_column :users, :direct_message_pref, :boolean, :default => true
    add_column :users, :comment_reply_pref, :boolean, :default => true
    add_column :users, :update_pref, :boolean, :default => true
    add_column :users, :funding_milestone_pref, :boolean, :default => true
    add_column :users, :profile_update_pref, :boolean, :default => true
    add_column :users, :answer_pref, :boolean, :default => true
    add_column :users, :alumvest_update_pref, :boolean, :default => true
    add_column :users, :featured_startup_pref, :boolean, :default => true
    add_column :users, :highlighted_update_pref, :boolean, :default => true
  end
end
