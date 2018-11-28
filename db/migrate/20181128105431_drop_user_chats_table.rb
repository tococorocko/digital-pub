class DropUserChatsTable < ActiveRecord::Migration[5.2]
  def change
  drop_join_table :chats, :users, table_name: :user_chats
  end
end
