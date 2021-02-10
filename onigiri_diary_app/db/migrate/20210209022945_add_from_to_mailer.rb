class AddFromToMailer < ActiveRecord::Migration[6.1]
  def change
    add_column :mailers,:from,:string
  end
end
