##
# Change full_url data_type
class ChangeFullUrlDataType < ActiveRecord::Migration
  def change
    change_column :tiny_urls, :full_url, :text
  end
end
