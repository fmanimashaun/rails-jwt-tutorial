class AddRangeToCarDetails < ActiveRecord::Migration[7.1]
  def change
    add_column :car_details, :range, :string
  end
end
