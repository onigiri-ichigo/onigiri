class AddEmailToMailers < ActiveRecord::Migration[6.1]
  def change
    add_column :mailers, :email,:string
  end
end
