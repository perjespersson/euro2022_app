class OnepagesController < ApplicationController

  # GET /onepages/1 or /onepages/1.json
  def show
    @games = Game.all.order(date: :asc)
  end
end
