class CreateDesigns < ActiveRecord::Migration[6.0]
  def change
    create_table :designs do |t|
      t.string     :title,       null:false
      t.text       :explanation, null:false
      t.integer    :category_id, null:false
      t.references :user,        null:false, foreign_key: true

      t.timestamps
    end
  end
end
