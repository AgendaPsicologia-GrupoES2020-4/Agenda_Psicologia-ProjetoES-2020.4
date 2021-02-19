require "test_helper"

class SessaoTest < ActiveSupport::TestCase
  test 'nao deve criar uma sessao com paciente vazio' do
    sessao = Sessao.new data:'17/03/2021', hora:'17:00', paciente_id:''
    assert_not sessao.save
  end

  test 'nao deve criar uma sessao com uma data passada' do
    sessao = Sessao.new data:'17/01/2021', hora:'17:00', paciente_id:'fabio'
    assert_not sessao.save
  end

  test 'nao deve editar uma sessao com paciente vazio' do
    sessao = Sessao.new data:'17/03/2021', hora:'17:00', paciente_id:'fabio'
    sessao.save
    assert_not sessao.update data:'17/03/2021', hora:'17:00', paciente_id:''
  end
end
