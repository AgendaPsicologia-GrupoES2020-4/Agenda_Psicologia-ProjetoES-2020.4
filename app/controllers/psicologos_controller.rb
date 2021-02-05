class PsicologosController < ApplicationController
  skip_before_action :autorizado, only: [:new, :create]

  def new
    @psicologo = Psicologo.new
  end

  def create
    @psicologo = Psicologo.create(params.require(:psicologo).permit(:crp, :nome, :password))
    
    respond_to do |format|
      if @psicologo.id
        session[:user_id] = @psicologo.id
        format.html { redirect_to '/principal', notice: 'Usuário criado com sucesso!' }
      else
        format.html { render :new, notice: 'Erro' }
        format.json { render json: @psicologo.errors, status: :unprocessable_entity }
      end
    end
  end
end
