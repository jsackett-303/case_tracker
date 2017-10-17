class ClientsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_paper_trail_whodunnit
  before_action :set_client, only: [:show, :edit, :update, :destroy]

  def search
    @clients =
      if params[:query].present?
        Client.search(params[:query])
      else
        Client.all
      end
    render :index
  end

  # GET /clients
  # GET /clients.json
  def index
    @clients = Client.all
  end

  # GET /clients/1
  # GET /clients/1.json
  def show
  end

  # GET /clients/new
  def new
    @client = Client.new
  end

  # GET /clients/1/edit
  def edit
  end

  # POST /clients
  # POST /clients.json
  def create
    @client = Client.new(client_params)

    respond_to do |format|
      if @client.save
        format.html { redirect_to @client, notice: 'Client was successfully created.' }
        format.json { render :show, status: :created, location: @client }
      else
        format.html { render :new }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clients/1
  # PATCH/PUT /clients/1.json
  def update
    respond_to do |format|
      if @client.update(client_params)
        format.html { redirect_to @client, notice: 'Client was successfully updated.' }
        format.json { render :show, status: :ok, location: @client }
      else
        format.html { render :edit }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clients/1
  # DELETE /clients/1.json
  def destroy
    @client.destroy
    respond_to do |format|
      format.html { redirect_to clients_url, notice: 'Client was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def import
    respond_to do |format|
      if Client.import_csv(params[:file])
        format.html { redirect_to clients_url, notice: 'Clients were successfully imported.' }
        format.json { head :no_content }
      else
        format.html { redirect_to clients_url, notice: 'Clients were not successfully imported. See the logs' }
        format.json { render notice: 'Trouble importing clients. See logs', status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client
      @client = Client.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def client_params
      params.require(:client).permit(:last_name, :first_name, :prefix, :street, :apartment, :city, :state, :zip_code,
                                     :phone1, :phone2, :email, :date_of_birth, :local_type, :dlw, :dli, :first_contact,
                                     :packet_sent, :sign_up_date, :initial_to_local, :verfication_of_local,
                                     :sixteen_ninety_six_to_oadr, :verification_of_oadr, :local, :oadr,
                                     :initial_appearance, :initial_denial, :recon_filed, :recon_denial,
                                     :fr_requested, :fr_sub, :rfh_filed, :rfh_acked, :proposed_exhibits,
                                     :ready_to_schedule, :date_scheduled, :claimant_hearing_prep, :notice_of_hearing,
                                     :hearing_date, :supplemental_date, :expedited, :decision, :decision_date, :alj,
                                     :ve, :me, :ac, :awarded_at, :appeal, :appeal_filed, :close_out_letter, :costs,
                                     :cost_two, :cost_three, :date_costs_received, :date_ssdi_received,
                                     :date_ssi_received, :case_id, :open)
    end
end
