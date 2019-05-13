# This migration comes from phccodesnipper (originally 20190502060733)
class CreatePhccodesnipperScriptUrls < ActiveRecord::Migration[5.2]
  def change

    create_table :phccodesnipper_script_urls do |t|

      t.string :script_url

      t.string :slug
      t.string :user_id

      t.references :snippet
      t.timestamps

    end

  end
end
