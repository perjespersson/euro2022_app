desc "Adding all users and bets"

task :add_users_and_bets => [ :environment ] do
  users = [
            {"name": "Jonas Persson", "bets": %w[2 2 1 1 2 x x 1 1 1 1 2 2 2 2 1 2 x 2]},
            {"name": "Annica Persson", "bets": %w[2 x 1 x 1 1 1 1 1 1 x x 1 x 2 1 2 x 2]},
            {"name": "Göran Myllenberg", "bets": %w[2 x 1 1 x 1 1 1 x x 1 2 2 2 2 1 1 2 2]},
            {"name": "Hanna Persson", "bets": %w[2 X 1 1 1 1 X 1 1 X 1 2 2 2 2 1 2 1 2]},
            {"name": "Jonathan Thörnkvist", "bets": %w[2 x 1 x 1 1 1 1 2 1 1 2 2 x 2 1 x x 2]},
            {"name": "Jesper Persson", "bets": %w[2 x 1 1 1 1 1 1 1 1 1 2 2 x 2 1 2 1 2]},
            {"name": "Inger Widgren", "bets": %w[2 1 2 1 1 x x 1 1 1 x 2 2 2 1 1 2 x 2]},
            {"name": "Fam LAJF", "bets": %w[2 1 x 1 1 1 x 1 1 1 1 2 2 2 2 1 2 x 2]},
            {"name": "Lis Myllenberg", "bets": %w[x 1 1 x 1 1 2 1 1 1 x 2 2 1 2 1 2 x 2]}
          ]
  games = Game.all.order(created_at: :asc)

  users.each do |user|
    User.create!(name: user[:name])

    # Skip 5 first since we began to late..
    games.drop(5).each_with_index do |game, index|
      Bet.create!(game_id: game.id, bet: user[:bets][index])
    end
  end
end