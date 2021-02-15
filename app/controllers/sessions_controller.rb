class SessionsController < ApplicationController
  skip_before_action :autorizado, only: [:new, :create, :landing]

  def index
    i = 0
    @pacientes_array = []
    @psicologos = Psicologo.all
    @psicologos.each do |user|
      user.pacientes.each do |pacien|
        @pacientes_array[i] = pacien
        i+=1
      end
    end
    return @pacientes_array
    #Session.search(params[:search])
  end

  def self.search(search)
    unless search.nil?
      puts search
    end
  end

  def new
  end

  def create
    @psicologo = Psicologo.find_by(crp: params[:crp])

    if @psicologo && @psicologo.authenticate(params[:password])
      session[:user_id] = @psicologo.id
      redirect_to agenda_psicologo_path(@psicologo.id)
    else
      # flash.alert = "Usuário ou senha incorreto"
      # redirect_to login_path, alert: "Usuário ou senha incorreto"
      # flash[:alert] = 'Usuário ou senha incorreto'
      redirect_to '/login', :alert => "CRP e/ou senha inválidos"

      # redirect_to login_path
      # flash.now[:notice] = 'Successfully checked in'
    end
  end

  def login
  end

  def destroy # logout
    session[:user_id] = nil
    redirect_to '/landing'
  end
  
  def landing
  end
end
