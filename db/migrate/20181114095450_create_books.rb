class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      	t.column :title, :string, :limit => 32, :null => false
      	t.column :total_pages, :integer, :default => 0
        t.column :description, :text
        t.column :proglang, :string, :limit => 15
      	t.timestamps
    end
  end
end
