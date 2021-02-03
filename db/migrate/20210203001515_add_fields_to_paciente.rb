class AddFieldsToPaciente < ActiveRecord::Migration[6.1]
  def change
    add_column :pacientes, :endereco, :string
    add_column :pacientes, :estado_civil, :string
    add_column :pacientes, :quant_filhos, :integer
    add_column :pacientes, :historico_doencas, :text
    add_column :pacientes, :medicamentos, :text
    add_column :pacientes, :eh_fumante, :string
    add_column :pacientes, :ingere_alcool, :string
  end
end
