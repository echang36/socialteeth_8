class AddFormatToAds < ActiveRecord::Migration
  def change
    add_column :ads, :format, :int
  end
end
