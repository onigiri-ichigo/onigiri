class RemoveFromFromMailer < ActiveRecord::Migration[6.1]
  def change
    remove_column :mailers,:from,:string
  end
end
