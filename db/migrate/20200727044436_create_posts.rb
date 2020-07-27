class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.column :title, :string
      t.column :body, :string
      t.column :author, :string
      t.column :icon, :string
      t.column :type, :string
      t.column :open, :boolean, default: true
      t.column :offer, :string
      t.column :offer_type, :string
      t.column :zipcode, :integer
      t.column :user_id, :integer

      t.timestamps()
    end
  end
end
