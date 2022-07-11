desc "Adding all teams and games"

task :add_teams_and_games => [ :environment ] do
  team_names = ["Sverige", "England", "Österrike", "Spanien", "Finland", "Portugal", "Schweiz", "Belgien", "Island", "Norge", "Nordirland", "Tyskland", "Danmark", "Nederländerna", "Frankrike", "Italien"]

  team_names.each do |team_name|
    Team.create!(name: team_name, image_badge_url: "/#{team_name.downcase}.png")
  end

  games = [
    {"home_team": "Nederländerna", "away_team": "Sverige", date: DateTime.parse("2022-07-09T21:00:00"), "round": 1  },
    {"home_team": "Belgien", "away_team": "Island", date: DateTime.parse("2022-07-10T18:00:00"), "round": 1  },
    {"home_team": "Frankrike", "away_team": "Italien", date: DateTime.parse("2022-07-10T21:00:00"), "round": 1  },

    {"home_team": "Österrike", "away_team": "Nordirland", date: DateTime.parse("2022-07-11T18:00:00"), "round": 2 },
    {"home_team": "England", "away_team": "Norge", date: DateTime.parse("2022-07-11T121:00:00"), "round": 2  },
    {"home_team": "Danmark", "away_team": "Finland", date: DateTime.parse("2022-07-12T18:00:00"), "round": 2  },
    {"home_team": "Tyskland", "away_team": "Spanien", date: DateTime.parse("2022-07-12T21:00:00"), "round": 2  },
    {"home_team": "Sverige", "away_team": "Schweiz", date: DateTime.parse("2022-07-13T18:00:00"), "round": 2  },
    {"home_team": "Nederländerna", "away_team": "Portugal", date: DateTime.parse("2022-07-13T21:00:00"), "round": 2  },
    {"home_team": "Italien", "away_team": "Island", date: DateTime.parse("2022-07-14T18:00:00"), "round": 2  },
    {"home_team": "Frankrike", "away_team": "Belgien", date: DateTime.parse("2022-07-14T21:00:00"), "round": 2  },

    {"home_team": "Österrike", "away_team": "Norge", date: DateTime.parse("2022-07-07T21:00:00"), "round": 3  },
    {"home_team": "Nordirland", "away_team": "England", date: DateTime.parse("2022-07-07T21:00:00"), "round": 3  },
    {"home_team": "Danmark", "away_team": "Spanien", date: DateTime.parse("2022-07-07T21:00:00"), "round": 3  },
    {"home_team": "Finland", "away_team": "Tyskland", date: DateTime.parse("2022-07-07T21:00:00"), "round": 3  },
    {"home_team": "Sverige", "away_team": "Portugal", date: DateTime.parse("2022-07-07T21:00:00"), "round": 3  },
    {"home_team": "Schweiz", "away_team": "Nederländerna", date: DateTime.parse("2022-07-07T21:00:00"), "round": 3  },
    {"home_team": "Italien", "away_team": "Belgien", date: DateTime.parse("2022-07-07T21:00:00"), "round": 3  },
    {"home_team": "Island", "away_team": "Frankrike", date: DateTime.parse("2022-07-07T21:00:00"), "round": 3  }
  ]

  games.each do |game|
    home_team = Team.find_by(name: game[:home_team])
    away_team = Team.find_by(name: game[:away_team])
    date = game[:date]
    round = game[:round]

    Game.create!(home_team_id: home_team.id, away_team_id: away_team.id, date: date, round: round)
  end
end