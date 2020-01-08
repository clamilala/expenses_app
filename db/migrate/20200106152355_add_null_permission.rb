class AddNullPermission < ActiveRecord::Migration[5.1]
  def change
    change_column_null :jounal_entries, :pay_classification_id, true
    change_column_null :jounal_entries, :income_classification_id, true
    change_column_null :jounal_entries, :wallet_id, true
    change_column_null :jounal_entries, :user_id, true
  end
end
