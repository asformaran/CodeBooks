class CreatePages < ActiveRecord::Migration[5.2]
  def change
    create_table :pages do |t|
    	t.column :book_id, :bigint, :null => false
    	t.column :pagenum, :integer, :null => false
    	t.column :content, :text
    	t.column :imgpath, :string
    	t.timestamps
    end
  end
end
