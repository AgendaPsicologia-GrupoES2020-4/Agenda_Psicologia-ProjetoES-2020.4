require "test_helper"

class PacienteTest < ActiveSupport::TestCase
  test "deve salvar paciente corretamente criado" do
    paciente = Paciente.new(
      "nome" => "Joao Pedro",
      "cpf" => "702.345.344-43",
      "telefone" => "(81)99826454",
      "email" => 'joao@gmail.com',
      "endereco" => 'Av. Coronel Geminiano, 625',
      "estado_civil" => 'Solteiro',
      "quant_filhos" => 0,
      "historico_doencas" => '',
      "medicamentos" => 'Rivotril',
      "eh_fumante" => 'Não',
      "ingere_alcool" => 'Sim',
      "psicologo_id" => psicologos(:psicologo_mock).id
    )

    assert paciente.save
  end
end
