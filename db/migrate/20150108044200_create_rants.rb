class CreateRants < ActiveRecord::Migration
  def change
    create_table :rants do |t|
      t.string :description

      t.timestamps
    end
  end
end
