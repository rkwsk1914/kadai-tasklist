class CreateKadaiTasklists < ActiveRecord::Migration[5.2]
  def change
    create_table :kadai_tasklists do |t|
      t.string :content

      t.timestamps
    end
  end
end
