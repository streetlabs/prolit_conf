class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.references :attendee

      t.timestamps
    end
  end
end
