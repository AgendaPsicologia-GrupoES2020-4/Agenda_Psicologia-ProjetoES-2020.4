class Sessao < ApplicationRecord
  belongs_to :paciente
  belongs_to :psicologo
  validates :data, presence: true
  validates :hora, presence: true
  validates :paciente_id, presence: true
  validate :validar_data_hora

  private 
    def validar_data_hora  
      if data < Date.today 
        errors.add(:data, "tem que ser a presente ou futura")
      else 
        hora_atual = Time.now
        if (hora.hour < hora_atual.hour or (hora.hour == hora_atual.hour and hora.min < hora_atual.min) )
          errors.add(:hora, "tem que ser a presente ou futura")
        end
      end
    end
end
