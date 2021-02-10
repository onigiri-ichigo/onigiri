class AddDiaryImageNameToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts,:diary_image_name, :string 
  end
end
