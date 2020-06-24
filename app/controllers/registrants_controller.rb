class RegistrantsController < ApplicationController
  before_action :authenticate_registrant!
  before_action :set_registrant, only: [:show, :edit, :update, :destroy]

  def index
    @registrants = Registrant.all
  end

  def show
  end


  def new
    @registrant = Registrant.new
  end

  
  def edit
  end

 
  def create
    @registrant = Registrant.new(registrant_params)

    respond_to do |format|
      if @registrant.save
        format.html { redirect_to @registrant, notice: 'Registrant was successfully created.' }
        format.json { render :show, status: :created, location: @registrant }
      else
        format.html { render :new }
        format.json { render json: @registrant.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @registrant.update(registrant_params)
        format.html { redirect_to @registrant, notice: 'Registrant was successfully updated.' }
        format.json { render :show, status: :ok, location: @registrant }
      else
        format.html { render :edit }
        format.json { render json: @registrant.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @registrant.destroy
    respond_to do |format|
      format.html { redirect_to registrants_url, notice: 'Registrant was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
 
    def set_registrant
      @registrant = Registrant.find(params[:id])
    end

    def registrant_params
      params.require(:registrant).permit(:first_name, :last_name, :contact, :address)
    end
end
