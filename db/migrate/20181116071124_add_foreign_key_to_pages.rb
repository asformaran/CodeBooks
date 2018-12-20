class AddForeignKeyToPages < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :pages, :books
  end
end
