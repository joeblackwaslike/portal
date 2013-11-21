class AddClearanceToUsers < ActiveRecord::Migration
  def self.up
    change_table :users  do |t|
      t.string :encrypted_password, :limit => 128
      t.string :confirmation_token, :limit => 128
      t.string :remember_token, :limit => 128
      t.remove :password_digest
    end

    add_index :users, :remember_token
  end

  def self.down
    change_table :users do |t|
      t.remove :encrypted_password,:confirmation_token,:remember_token
      t.string :password_digest
    end
  end
end
