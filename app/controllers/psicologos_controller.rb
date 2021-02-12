class PsicologosController < ApplicationController
  skip_before_action :autorizado, only: [:new, :create]
  before_action :set_psicologo, only: [:show, :edit, :update, :destroy]

  def new
    @psicologo = Psicologo.new
  end

  # GET /psicologos/1
  # GET /psicologos/1.json
  def show
    redirect_to '/agenda' unless @psicologo.id == session[:user_id]
    return 
  end

  def create
    @psicologo = Psicologo.create(params.require(:psicologo).permit(:crp, :nome, :password))
    
    respond_to do |format|
      if @psicologo.id
        session[:user_id] = @psicologo.id
        format.html { redirect_to '/agenda', notice: 'Usuário criado com sucesso!' }
      else
        format.html { render :new, notice: 'Erro' }
        format.json { render json: @psicologo.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_psicologo
      @psicologo = Psicologo.find(params[:id])
    end
end
