class EventsController < ApplicationController
  extend SimpleCalendar
  
  def index
    @events = Event.all
  end
  
  def new
    @event = Event.new
  end

  def create
    @event = Event.new(params.require(:event).permit(:name, :start_time, :end_time))
    @event.created_by = "test"

    respond_to do |format|
    if @event.save
      format.html { redirect_to @event, notice: 'Event added!' }
      format.json { render :show, status: :created, location: @event }
    else
      format.html { render :new }
      format.json { render json: @event.errors, status: :unprocessable_entity }
    end
  end
  end

  def display
    if !check_logged_in
      redirect_to root_path
    else
      @events = Event.all 
    end
  end

  def show
    @event = Event.find(params[:id])
  end

end
