class CreateAttendees < ActiveRecord::Migration
  def self.up
    create_table :attendees do |t|
      t.string :name
      t.string :title
      t.string :institution
      t.text :bio

      t.timestamps
    end
  end

  def self.down
    drop_table :attendees
  end
end