class CreateCreativeQualities < ActiveRecord::Migration[5.0]
  def change
    create_table :creative_qualities do |t|
      t.string :name, :color
      t.text :description

      t.timestamps
    end
  end
end
