class CreatePapers < ActiveRecord::Migration
  def self.up
    create_table :papers do |t|
      t.string :title
      t.text :description
      t.boolean :keynote
      t.integer :presentation_id

      t.timestamps
    end
  end

  def self.down
    drop_table :papers
  end
end
