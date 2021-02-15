class PsicologosController < ApplicationController
  skip_before_action :autorizado, only: [:new, :create]
  helper_method :buscar_paciente

  def new
    @psicologo = Psicologo.new
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
    if search!=nil
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
      if sec.data.strftime("%Y-%m-%d") == data
        @sessaos_dia.push(sec)
        puts sec.data
      end

    end
    return @sessaos_dia.sort{ |a, b| a.hora <=> b.hora }
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
