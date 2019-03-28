class AddPasswordDigestToUsers < ActiveRecord::Migration
  def change
    add_colums :users, :pasword_digest, :string
  end
end
