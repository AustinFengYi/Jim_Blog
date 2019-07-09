class AddColumnStatusToPost < ActiveRecord::Migration[5.2]
  def change
    add_column :blogs,:status,:boolean,default:false
  end
end
