class CreateSessaos < ActiveRecord::Migration[6.1]
  def change
    create_table :sessaos do |t|
      t.date :data
      t.time :hora
      t.references :paciente, null: false, foreign_key: true
      t.references :psicologo, null: false, foreign_key: true

      t.timestamps
    end
  end
end
