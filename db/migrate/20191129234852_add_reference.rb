class AddReference < ActiveRecord::Migration[5.1]
  def up
    execute 'DELETE FROM payments;'
    execute 'DELETE FROM pay_types;'
    
    add_reference :payments, :user, index: true
    add_reference :pay_types, :user, index: true
  end
  
  def down
    remove_reference :payments, :user, index: true
    remove_reference :pay_types, :user, index: true
  end
end
