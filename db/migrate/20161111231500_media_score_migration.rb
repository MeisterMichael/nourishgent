class MediaScoreMigration < ActiveRecord::Migration

	def change

		add_column :media, :score, :float, default: 1.0
		add_index :media, [ :score, :category_id, :status, :publish_at ]
		add_index :media, [ :score, :status, :publish_at ]

	end
end
