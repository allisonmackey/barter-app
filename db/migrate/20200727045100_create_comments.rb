class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.column :author, :string
      t.column :body, :string
      t.column :offer, :string
      t.column :offer_type, :string
      t.column :post_id, :integer
      
      t.timestamps()
    end
  end
end
