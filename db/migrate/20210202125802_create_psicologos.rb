class CreatePsicologos < ActiveRecord::Migration[6.1]
  def change
    create_table :psicologos do |t|
      t.string :crp
      t.string :nome
      t.string :password_digest

      t.timestamps
    end
  end
end
