namespace :chat do
  desc "Changes status to online one hour before the game"
  task toggle_status: :environment do
    games = Game.all
    games.each do |game|
      chats = Chat.where(game_id: game.id)
      chats.each do |chat|
        if game.kick_off_time - Time.now.utc < 3600 && game.kick_off_time - Time.now.utc > 0 || Time.now.utc - game.kick_off_time > 0 && Time.now.utc - game.kick_off_time < 21600
          chat.online == true
        elsif Time.now.utc - game.kick_off_time > 21600
          chat.destroy
        else
          chat.online == false
        end
      end
    end
  end
end
