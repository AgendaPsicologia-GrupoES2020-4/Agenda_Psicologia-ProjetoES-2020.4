class Sessao < ApplicationRecord
  belongs_to :paciente
  belongs_to :psicologo
  validates :data, presence: true
  validates :hora, presence: true
  validates :paciente_id, presence: true
  validate :validar_data_hora

  private 
    def validar_data_hora  
      data_hoje = Time.zone.today
      if data < data_hoje
        errors.add(:data, "tem que ser a presente ou futura")
      else
        if(data == data_hoje)
          hora_atual = Time.now
          hora_invalida = hora.hour < hora_atual.hour
          minuto_invalido = hora.hour == hora_atual.hour and hora.min < hora_atual.min
          if (hora_invalida or minuto_invalido)
            errors.add(:hora, "tem que ser a presente ou futura")
          end
        end
      end
    end
end
