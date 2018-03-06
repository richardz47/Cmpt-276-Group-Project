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

    if @event.auto != 'Yes'
      respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event added!' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
      end

    else

      #Our Google direction API key
      #AIzaSyD4UP1Q6w4sV6XDdJgYUbAguPd4YVhPro0

      @events = Event.all

      @event.end_time = @event.start_time + (@event.duration.to_i) * 60

      autoDone = false

      @events.each do |event|

        pointA = (@event.location).gsub(' ', '+')
        pointB = (event.location).gsub(' ', '+')

        if event.start_time.to_date == Date.current && event.created_by == current_user.email
            if ((event.end_time >= @event.start_time) && (@event.end_time >= event.end_time))
              request = "http://maps.googleapis.com/maps/api/distancematrix/json?units=imperial&origins=" + pointB + "&destinations=" + pointA
              response = HTTParty.get(request)
              if (response["status"] == "OK")
                duration = response["rows"][0]["elements"][0]["duration"]["value"]
              else
                duration = 0
              end

                @event.start_time = event.end_time + 5*60 + duration
                @event.end_time = @event.start_time + (@event.duration.to_i) * 60

            elsif ((event.start_time >= @event.start_time) && (@event.end_time >= event.start_time))

              request = "http://maps.googleapis.com/maps/api/distancematrix/json?units=imperial&origins=" + pointA + "&destinations=" + pointB
              response = HTTParty.get(request)
              if (response["status"] == "OK")
                duration = response["rows"][0]["elements"][0]["duration"]["value"]
              else
                duration = 0
              end

              @event.end_time = event.start_time - 5*60 - duration
              @event.start_time = @event.end_time - (@event.duration.to_i) * 60

            end
        end
      end


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
