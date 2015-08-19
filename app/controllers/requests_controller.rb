class RequestsController < ApplicationController
  before_action :set_request, only: [:show, :edit, :update, :destroy]

  # GET /requests
  # GET /requests.json
  def index
    @requests = Request.all
  end

  # GET /requests/1
  # GET /requests/1.json
  def show
  end

  # GET /requests/new
  def new
    @request = Request.new
  end

  # GET /requests/1/edit
  def edit
  end

  # POST /requests
  # POST /requests.json
  def create
    @request = current_user.requests.new(request_params_for_create)
    # @request = Request.new(request_params_for_create)

    respond_to do |format|
      if @request.save
        format.html { redirect_to requests_path, notice: 'Request was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /requests/1
  # PATCH/PUT /requests/1.json
  def update
    respond_to do |format|
      if @request.update(request_params_for_update)
        format.html { redirect_to requests_path, notice: 'Request was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /requests/1
  # DELETE /requests/1.json
  def destroy
    @request.destroy
    respond_to do |format|
      format.html { redirect_to requests_url, notice: 'Request was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request
      @request = Request.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def request_params_for_create
      # userid = current_user.id
      params.require(:request).permit(:leave_date, :comeback_date, :description, :leave_type, :leave_status)
      # a[:userid] = current_user.id.to_s
      # a
    end

    def request_params_for_update
      userid = current_user.id
      params.require(:request).permit(:leave_date, :comeback_date, :description, :leave_type, :leave_status)
    end
  end
