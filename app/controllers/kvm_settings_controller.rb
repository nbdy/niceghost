class KvmSettingsController < ApplicationController
  before_action :set_kvm_setting, only: [:show, :edit, :update, :destroy]

  # GET /kvm_settings
  # GET /kvm_settings.json
  def index
    @kvm_settings = KvmSetting.all
  end

  # GET /kvm_settings/1
  # GET /kvm_settings/1.json
  def show
  end

  # GET /kvm_settings/new
  def new
    @kvm_setting = KvmSetting.new
  end

  # GET /kvm_settings/1/edit
  def edit
  end

  # POST /kvm_settings
  # POST /kvm_settings.json
  def create
    @kvm_setting = KvmSetting.new(kvm_setting_params)

    respond_to do |format|
      if @kvm_setting.save
        format.html { redirect_to @kvm_setting, notice: 'Kvm setting was successfully created.' }
        format.json { render :show, status: :created, location: @kvm_setting }
      else
        format.html { render :new }
        format.json { render json: @kvm_setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /kvm_settings/1
  # PATCH/PUT /kvm_settings/1.json
  def update
    respond_to do |format|
      if @kvm_setting.update(kvm_setting_params)
        format.html { redirect_to @kvm_setting, notice: 'Kvm setting was successfully updated.' }
        format.json { render :show, status: :ok, location: @kvm_setting }
      else
        format.html { render :edit }
        format.json { render json: @kvm_setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /kvm_settings/1
  # DELETE /kvm_settings/1.json
  def destroy
    @kvm_setting.destroy
    respond_to do |format|
      format.html { redirect_to kvm_settings_url, notice: 'Kvm setting was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_kvm_setting
      @kvm_setting = KvmSetting.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def kvm_setting_params
      params.require(:kvm_setting).permit(:hypervisor_uri, :update_interval, :vm_path)
    end
end
