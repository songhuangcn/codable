class CreateEditors < ActiveRecord::Migration[6.0]
  def change
    create_table :editors do |t|
      t.string :key

      t.timestamps
    end
  end
end
