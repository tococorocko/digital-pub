class AddOnlineToChats < ActiveRecord::Migration[5.2]
  def change
    add_column :chats, :online, :boolean, default: false
  end
end
