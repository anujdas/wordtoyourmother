class DevicesController < ApplicationController
  def index
    @devices = Device.all

    respond_to do |format|
      format.html
      format.json { render :json => @devices }
    end
  end

  def create
    if !params[:identifier].blank?
      d = Device.new
      d.identifier = params[:identifier]
      d.locate_enabled = false
    end
    respond_to do |format|
      format.html
      format.json { render :json => @devices }
    end
  end

  def show
    if !params[:id].blank?
      @device = Device.find_by_identifier(params[:id])

      respond_to do |format|
        format.html
        format.json { render :json => @device }
      end
    end
  end

  def destroy
    @device = Device.find_by_identifier(params[:identifier])
    @device.destroy

    respond_to do |format|
      format.html { redirect_to devices_url }
      format.json { head :ok }
    end
  end
end
