class SessaosController < ApplicationController
  before_action :get_psicologo
  before_action :set_sessao, only: [:show, :edit, :update, :destroy]
  #before_action :set_pacientes, only: [:create, :edit]
  helper_method :usuario_autorizado?
  helper_method :buscar_paciente


  # GET /sessaos
  # GET /sessaos.json
  def index
    @sessaos = @psicologo.sessaos
      unless @sessaos[0].nil?
        unless @sessaos[0].psicologo_id == session[:user_id]
          redirect_to agenda_psicologo_path(usuario_atual)
        end
      end


  end

  # GET /sessaos/1
  # GET /sessaos/1.json
  def show
    redirect_to agenda_psicologo_path(usuario_atual) unless usuario_autorizado?
    return
  end

  # GET /sessaos/new
  def new
    @sessao = @psicologo.sessaos.build
  end

  # GET /sessaos/1/edit
  def edit
    redirect_to agenda_psicologo_path(usuario_atual) unless usuario_autorizado?
    return
  end

  # POST /sessaos
  # POST /sessaos.json
  def create
    @sessao = @psicologo.sessaos.build(sessao_params)

    respond_to do |format|
      if @sessao.save
        format.html { redirect_to psicologo_sessaos_path(@psicologo, @sessao), notice: 'Sessao was successfully created.' }
        format.json { render :show, status: :created, location: @sessao }
      else
        format.html { render :new }
        format.json { render json: @sessao.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sessaos/1
  # PATCH/PUT /sessaos/1.json
  def update
    return unless usuario_autorizado?

    respond_to do |format|
      if @sessao.update(sessao_params)
        format.html { redirect_to psicologo_sessaos_path(@psicologo), notice: 'Sessao was successfully updated.' }
        format.json { render :show, status: :ok, location: @sessao }
      else
        format.html { render :edit }
        format.json { render json: @sessao.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sessaos/1
  # DELETE /sessaos/1.json
  def destroy
    return unless usuario_autorizado?

    @sessao.destroy
    respond_to do |format|
      format.html { redirect_to psicologo_sessaos_path(@psicologo), notice: 'Sessao was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sessao
      @sessao = Sessao.find(params[:id])
    end

    def get_psicologo
      @psicologo = Psicologo.find(params[:psicologo_id])
    end

    def get_paciente
      @paciente = @psicologo.paciente.find(params[:paciente_id])
    end
    # Only allow a list of trusted parameters through.
    def sessao_params
      params.require(:sessao).permit(:data, :hora, :paciente_id)
    end

    def usuario_autorizado?
      @sessao.psicologo_id == session[:user_id]
    end

    def set_pacientes
      @pacientes = @psicologo.pacientes
    end

    def buscar_paciente(id)
      @pacientes = @psicologo.pacientes

      @pacientes.each do |pacien|
        if pacien.id == id
          return pacien
        end
      end
      return
    end


end
