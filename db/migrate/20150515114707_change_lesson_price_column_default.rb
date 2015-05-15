class ChangeLessonPriceColumnDefault < ActiveRecord::Migration
  def change
    change_column :lessons, :min_price, :float, :default => 0
    change_column :lessons, :max_price, :float, :default => 0
  end
end
