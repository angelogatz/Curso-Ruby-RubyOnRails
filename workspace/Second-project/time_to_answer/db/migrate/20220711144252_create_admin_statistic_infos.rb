class CreateAdminStatisticInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :admin_statistic_infos do |t|
      t.string :event
      t.integer :value, default: 0

      t.timestamps
    end
  end
end
