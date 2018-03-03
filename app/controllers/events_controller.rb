class EventsController < ApplicationController
  extend SimpleCalendar
  
  def index
    @events = Event.all
  end
  
  def new
    if check_logged_in
      @event = Event.new
    else 
      redirect_to root_path
    end
  end

  def create
    @event = Event.new(params.require(:event).permit(:name, :start_time, :end_time, :location, :auto, :duration))
    @event.created_by = current_user.email

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
    if check_logged_in
      if @event.created_by != current_user.email
        redirect_to displayevents_path
      end
    else
      redirect_to root_path
    end
  end

end
