class CalendaritemsController < ApplicationController
  before_action :set_calendaritem, only: [:show, :edit, :update, :destroy]

  # GET /calendaritems
  # GET /calendaritems.json
  def index
    @calendaritems = Calendaritem.all
  end

  # GET /calendaritems/1
  # GET /calendaritems/1.json
  def show
  end

  # GET /calendaritems/new
  def new
    @calendaritem = Calendaritem.new
  end

  # GET /calendaritems/1/edit
  def edit
  end

  # POST /calensdaritems
  # POST /calendaritems.json
  def create
    @calendaritem = Calendaritem.new(params.require(:event).permit(:time,:endtime, :date, :name))

    if @calendaritem.save
      redirect_to event_path
    else
      render 'new'
    end

  end

  # PATCH/PUT /calendaritems/1
  # PATCH/PUT /calendaritems/1.json
  def update
    respond_to do |format|
      if @calendaritem.update(calendaritem_params)
        format.html { redirect_to @calendaritem, notice: 'Calendaritem was successfully updated.' }
        format.json { render :show, status: :ok, location: @calendaritem }
      else
        format.html { render :edit }
        format.json { render json: @calendaritem.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /calendaritems/1
  # DELETE /calendaritems/1.json
  def destroy
    @calendaritem.destroy
    respond_to do |format|
      format.html { redirect_to calendaritems_url, notice: 'Calendaritem was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_calendaritem
      @calendaritem = Calendaritem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def calendaritem_params
      params.require(:calendaritem).permit(:name, :date, :time, :endtime)
    end
end
