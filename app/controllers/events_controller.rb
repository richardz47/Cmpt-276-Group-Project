class EventsController < ApplicationController
  extend SimpleCalendar
  
  def index
    @events = Event.all
  end
  
  def new
    @event = Event.new
  end

  def create
    @event = Event.new(params.require(:event).permit(:start,:end, :start_time, :name))

    if @event.save
       flash[:message] = "Event added!"
      redirect_to '/displayevents'
    else
      render 'new'
    end

  end

  def display
    @events = Event.all
    if !check_logged_in
      redirect_to root_path
    end
  end

  def show
  end

  def create
  end
end
