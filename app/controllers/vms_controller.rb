class VmsController < ApplicationController
  before_action :set_vm, only: [:show, :edit, :update, :destroy]

  def search
    @vms = if params[:search].empty?
             Vm.all
           else
             Vm.where("#{Vm.connection.quote_table_name(Vm.table_name)}.#{Vm.connection.quote_column_name(params[:key])} = ?", params[:search])
           end
  end

  # GET /vms
  # GET /vms.json
  def index
    @vms = Vm.all
  end

  # GET /vms/1
  # GET /vms/1.json
  def show
  end

  # GET /vms/new
  def new
    @vm = Vm.new
  end

  # GET /vms/1/edit
  def edit
  end

  # POST /vms
  # POST /vms.json
  def create
    @vm = Vm.new(vm_params)

    respond_to do |format|
      if @vm.save
        format.html { redirect_to @vm, notice: 'Vm was successfully created.' }
        format.json { render :show, status: :created, location: @vm }
      else
        format.html { render :new }
        format.json { render json: @vm.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vms/1
  # PATCH/PUT /vms/1.json
  def update
    respond_to do |format|
      if @vm.update(vm_params)
        format.html { redirect_to @vm, notice: 'Vm was successfully updated.' }
        format.json { render :show, status: :ok, location: @vm }
      else
        format.html { render :edit }
        format.json { render json: @vm.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vms/1
  # DELETE /vms/1.json
  def destroy
    @vm.destroy
    respond_to do |format|
      format.html { redirect_to vms_url, notice: 'Vm was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_vm
    @vm = Vm.find(params[:id])
  end

    # Only allow a list of trusted parameters through.
  def vm_params
    params.require(:vm).permit(:name, :cpu_count, :memory, :state)
  end
end
