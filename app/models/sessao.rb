class Sessao < ApplicationRecord
  belongs_to :paciente
  belongs_to :psicologo
  validates :data, presence: true
  validates :hora, presence: true
  validates :paciente_id, presence: true
end
