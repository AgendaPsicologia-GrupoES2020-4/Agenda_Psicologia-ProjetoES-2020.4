class ApplicationController < ActionController::Base
  before_action :autorizado
  helper_method :usuario_atual
  helper_method :logado?
  
  def usuario_atual    
    Psicologo.find_by(id: session[:user_id])  
  end
  
  def logado?
    !usuario_atual.nil?  
  end

  def autorizado
    redirect_to '/login' unless logado?
 end

end
