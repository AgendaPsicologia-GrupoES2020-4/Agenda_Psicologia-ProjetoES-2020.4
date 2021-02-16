require "application_system_test_case"

class SessaosTest < ApplicationSystemTestCase
  setup do
    @sessao = sessaos(:one)
  end

  test "visiting the index" do
    visit sessaos_url
    assert_selector "h1", text: "Sessaos"
  end

  test "creating a Sessao" do
    visit sessaos_url
    click_on "New Sessao"

    fill_in "Data", with: @sessao.data
    fill_in "Hora", with: @sessao.hora
    fill_in "Paciente", with: @sessao.paciente_id
    fill_in "Psicologo", with: @sessao.psicologo_id
    click_on "Create Sessao"

    assert_text "Sessao was successfully created"
    click_on "Back"
  end

  test "updating a Sessao" do
    visit sessaos_url
    click_on "Edit", match: :first

    fill_in "Data", with: @sessao.data
    fill_in "Hora", with: @sessao.hora
    fill_in "Paciente", with: @sessao.paciente_id
    fill_in "Psicologo", with: @sessao.psicologo_id
    click_on "Update Sessao"

    assert_text "Sessao was successfully updated"
    click_on "Back"
  end

  test "destroying a Sessao" do
    visit sessaos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Sessao was successfully destroyed"
  end
end
