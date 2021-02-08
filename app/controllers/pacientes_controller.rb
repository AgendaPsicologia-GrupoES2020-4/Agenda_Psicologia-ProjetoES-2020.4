class PacientesController < ApplicationController
  before_action :get_psicologo
  before_action :set_paciente, only: [:show, :edit, :update, :destroy]
  helper_method :usuario_autorizado?

  # GET /pacientes
  # GET /pacientes.json
  def index
    @pacientes = @psicologo.pacientes
    unless @pacientes[0].nil?
      unless @pacientes[0].psicologo_id == session[:user_id]
        redirect_to '/agenda'
      end
    end

  end


  # GET /pacientes/1
  # GET /pacientes/1.json
  def show
    redirect_to '/agenda' unless usuario_autorizado?
    return 
  end

  # GET /pacientes/new
  def new
    @paciente = @psicologo.pacientes.build
  end

  # GET /pacientes/1/edit
  def edit
    redirect_to '/agenda' unless usuario_autorizado?
    return 
  end

  # POST /pacientes
  # POST /pacientes.json
  def create
    @paciente = @psicologo.pacientes.build(
    "nome" => paciente_params[:nome],
    "cpf" => paciente_params[:cpf],
    "telefone" => paciente_params[:telefone],
    "email" => paciente_params[:email],
    "endereco" => paciente_params[:endereco],
    "estado_civil" => paciente_params[:estado_civil],
    "quant_filhos" => paciente_params[:quant_filhos],
    "historico_doencas" => paciente_params[:historico_doencas],
    "medicamentos" => paciente_params[:medicamentos],
    "eh_fumante" => paciente_params[:eh_fumante],
    "ingere_alcool" => paciente_params[:ingere_alcool],
    "psicologo_id" => session[:user_id]
    )

    respond_to do |format|
      if @paciente.save
        format.html { redirect_to psicologo_pacientes_path(@psicologo, @paciente), notice: 'Paciente was successfully created.' }
        format.json { render :show, status: :created, location: @paciente }
      else
        format.html { render :new }
        format.json { render json: @paciente.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pacientes/1
  # PATCH/PUT /pacientes/1.json
  def update
    return unless usuario_autorizado?

    respond_to do |format|
      if @paciente.update(paciente_params)
        format.html { redirect_to psicologo_pacientes_path(@psicologo), notice: 'Paciente was successfully updated.' }
        format.json { render :show, status: :ok, location: @paciente }
      else
        format.html { render :edit }
        format.json { render json: @paciente.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pacientes/1
  # DELETE /pacientes/1.json
  def destroy
    return unless usuario_autorizado?

    @paciente.destroy
    respond_to do |format|
      format.html { redirect_to psicologo_pacientes_path(@psicologo), notice: 'Paciente was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_paciente
      @paciente = @psicologo.pacientes.find(params[:id])
    end

  def get_psicologo
    @psicologo = Psicologo.find(params[:psicologo_id])
  end

  # Only allow a list of trusted parameters through.
    def paciente_params
      params.require(:paciente).permit(:nome, :cpf, :telefone, :email, :endereco, :estado_civil, :quant_filhos, :historico_doencas, :medicamentos, :eh_fumante, :ingere_alcool)
    end

    def usuario_autorizado? 
      @paciente.psicologo_id == session[:user_id]
    end
end
