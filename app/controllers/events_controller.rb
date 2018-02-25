class EventsController < ApplicationController
  def index
    @event = Event.all
  end
  
  def new
    if !check_logged_in
      redirect_to root_path
    
    else
      @event = Event.new
    end
  end

  def display
    if !check_logged_in
      redirect_to root_path
    end
  end

  def show
  end

  def create
  end
end
