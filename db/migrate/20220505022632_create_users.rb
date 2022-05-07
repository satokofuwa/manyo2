class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.text   :email,null: false
      t.string :password_digest
      t.index [:email], name: 'index_users_on_email', unique: true
      t.index [:id],name: 'index_users_on_id'
      t.timestamps
    end
  end
end
