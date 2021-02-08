require "test_helper"

class PacienteTest < ActiveSupport::TestCase
  test "deve salvar paciente corretamente criado" do
    paciente = Paciente.new(
      "nome" => "Joao Pedro",
      "cpf" => "254.674.365-43",
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

  test "nao deve salvar paciente sem nome" do
    paciente = Paciente.new(
      "nome" => "",
      "cpf" => "253.345.864-45",
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

    assert_not paciente.save
  end

  test "nao deve salvar paciente com cpf em uso" do
    paciente = Paciente.new(
      "nome" => "Joao Pedro",
      "cpf" => "702.345.344-45", #CPF já em uso, eu criei um fixture com um paciente com o mesmo cpf
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

    assert_not paciente.save
  end

end
