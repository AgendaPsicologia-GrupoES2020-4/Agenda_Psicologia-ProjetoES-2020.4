require "test_helper"

class PsicologoTest < ActiveSupport::TestCase
  test 'cria um psicologo valido' do
    psicologo = Psicologo.new crp:'1234567', nome:'fabio', password:'123456'
    assert psicologo.save
  end

  test 'o crp do psicologo deve ser unico' do
    psicologo = Psicologo.new crp:'1234567', nome:'fabio', password:'123456'
    psicologo2 = Psicologo.new crp:'1234567', nome:'fabio', password:'123456'
    psicologo.save
    assert_not psicologo2.save
  end

  test 'nao deve criar um psicologo com crp vazio' do
    psicologo = Psicologo.new crp:'', nome:'fabio', password:'123456'
    assert_not psicologo.save
    end
end