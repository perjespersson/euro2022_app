class OnepagesController < ApplicationController

  # GET /onepages/1 or /onepages/1.json
  def show
    @games = Game.all.order(date: :asc)
    @latest_game = Game.where.not(home_team_score: nil, away_team_score: nil).last
    @next_game = Game.where(home_team_score: nil, away_team_score: nil).first
    @result = ActiveRecord::Base.connection.execute(result_query)
  end

  private

  def result_query
    <<~QUERY
      WITH result AS (
        SELECT
          users.name,
          bets.bet,
          CASE
            WHEN home_team_score > away_team_score
              THEN '1'
            WHEN home_team_score = away_team_score
              THEN 'x'
            WHEN home_team_score < away_team_score
              THEN '2'
          END result
        FROM
          users
        JOIN
          bets
        ON
          bets.user_id = users.id
        JOIN
          games
        ON
          games.id = bets.game_id
        WHERE
          games.home_team_score IS NOT NULL
          AND games.away_team_score IS NOT NULL
      ), points AS (
        SELECT
          name,
          CASE
            WHEN bet = result
              THEN 1
            WHEN bet != result
              THEN 0
          END point
        FROM
          result
      )

      SELECT
        name,
        SUM(point) AS "points"
      FROM
        points
      GROUP BY
        name
      ORDER BY
        points
      DESC
    QUERY
  end
end
