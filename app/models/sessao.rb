class Sessao < ApplicationRecord
  belongs_to :paciente
  belongs_to :psicologo

end
