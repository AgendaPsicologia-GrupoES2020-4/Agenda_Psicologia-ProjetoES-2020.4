class AddReferenceToPaciente < ActiveRecord::Migration[6.1]
  def change
    add_reference :pacientes, :psicologo, foreign_key: true
  end
end
