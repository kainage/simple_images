class CreateSimpleImages < ActiveRecord::Migration
  def change
    create_table :simple_images do |t|
      t.references :imageable, polymorphic: true, null: false
      t.string :title
      t.text :description
      t.integer :user_id
      t.string :image_uid, null: false
      t.string :image_name, null: false
      t.boolean :active, null: false, default: true

      t.timestamps
    end

    add_index :simple_images, [:imageable_id, :imageable_type]
  end
end