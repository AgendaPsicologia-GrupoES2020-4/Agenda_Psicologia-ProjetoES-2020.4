class PsicologosController < ApplicationController
  skip_before_action :autorizado, only: [:new, :create]

  def new
    @psicologo = Psicologo.new
  end

  def create
    @psicologo = Psicologo.create(params.require(:psicologo).permit(:crp, :nome, :password))
    session[:user_id] = @psicologo.id
    redirect_to '/principal'
  end
end
