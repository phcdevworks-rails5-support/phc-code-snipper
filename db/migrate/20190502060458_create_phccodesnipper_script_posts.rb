class CreatePhccodesnipperScriptPosts < ActiveRecord::Migration[5.2]
  def change

    create_table :phccodesnipper_script_posts do |t|

      t.string :script_tittle
      t.text :script_snippet

      t.string :user_id
      t.string :org_id

      t.timestamps

    end

  end
end
