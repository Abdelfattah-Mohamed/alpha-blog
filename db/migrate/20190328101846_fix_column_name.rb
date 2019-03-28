class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :users, :usrname, :username
  end
end
