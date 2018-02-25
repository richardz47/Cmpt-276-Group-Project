class CalendaritemsController < ApplicationController
  before_action :set_calendaritem, only: [:show, :edit, :update, :destroy]


  def index
    @calendaritems = Calendaritem.all
  end


  def show
  end

  def new
    @calendaritem = Calendaritem.new
  end

  def edit
  end

  def create
    @calendaritem = Calendaritem.new(params.require(:event).permit(:time,:endtime, :date, :name))

    if @calendaritem.save
      redirect_to event_path
    else
      render 'new'
    end

  end

