class GamesController < ApplicationController
  def index
    session[:gold] ||= 0
    @options = Option.all
    @activities = Activity.all.limit(10).order('created_at desc')
  end

  def pilfer
    choice = Option.where(location:"#{params[:location]}").first
    if (choice[:gold_min] < 0) && (session[:gold] < choice[:gold_max])
      flash[:error] = "Only have #{session[:gold]} available, need at least #{choice[:gold_max]} gold to enter the casino."
    else
      gold = rand(choice[:gold_min]..choice[:gold_max])
      activity = Activity.create(location: choice[:location], gold: gold)
      session[:gold] += gold
    end
    redirect_to games_path
  end

  def reset
    session[:gold] = nil
    Activity.reset
    redirect_to games_path
  end
end