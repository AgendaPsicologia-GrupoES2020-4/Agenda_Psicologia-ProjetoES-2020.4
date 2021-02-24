class PsicologosController < ApplicationController
  skip_before_action :autorizado, only: [:new, :create]
  helper_method :buscar_paciente
  before_action :set_psicologo, only: [:show, :edit, :update, :destroy]


  def new
    @psicologo = Psicologo.new
  end

  # GET /psicologos/1
  # GET /psicologos/1.json
  def show
    redirect_to agenda_psicologo_path(@psicologo.id) unless @psicologo.id == session[:user_id]
    return 
  end

  # GET /psicologos/1/edit
  def edit
    redirect_to agenda_psicologo_path(@psicologo.id) unless @psicologo.id == session[:user_id]
    return 
  end

  def create
    @psicologo = Psicologo.create(params.require(:psicologo).permit(:crp, :nome, :password))
    
    respond_to do |format|
      if @psicologo.id
        session[:user_id] = @psicologo.id
        format.html { redirect_to agenda_psicologo_path(@psicologo.id), notice: 'Usuário criado com sucesso!' }
      else
        format.html { render :new, notice: 'Erro' }
        format.json { render json: @psicologo.errors, status: :unprocessable_entity }
      end
    end
  end

  def self.search(search)
    unless search.nil?
      puts search
    end
  end

  def main
    @psicologo = usuario_atual
    @sessaos_dia = buscar_sessaos(params[:search], @psicologo)

  end

  def buscar_sessaos(data, psicologo)
    PsicologosController.search(data)
    @sessaos_dia = []
    @sessaos = psicologo.sessaos
    @sessaos.each do |sec|
      data_sessao = sec.data.strftime("%Y-%m-%d")
      if data_sessao == data
        @sessaos_dia.push(sec)
      end

    end
    @sessaos_dia.sort{ |a, b| a.hora <=> b.hora }
    return @sessaos_dia
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

  # PATCH/PUT /psicologos/1
  # PATCH/PUT /psicologos/1.json
  def update
    return unless @psicologo.id == session[:user_id]

    respond_to do |format|
      psicologo_params = params.require(:psicologo).permit(:crp, :nome, :password)
      if @psicologo.update(psicologo_params)
        format.html { redirect_to "/psicologos/#{@psicologo.id}", notice: 'Psicologo was successfully updated.' }
        format.json { render :show, status: :ok, location: @psicologo }
      else
        format.html { render :edit }
        format.json { render json: @psicologo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /psicologos/1
  # DELETE /psicologos/1.json
  def destroy
    return unless @psicologo.id == session[:user_id]

    @psicologo.destroy
    redirect_to '/landing'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_psicologo
      @psicologo = Psicologo.find(params[:id])
    end

end
