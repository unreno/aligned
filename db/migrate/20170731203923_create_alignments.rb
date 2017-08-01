class CreateAlignments < ActiveRecord::Migration[5.1]
	def change
		create_table :alignments do |t|
			t.string :sequence
			t.integer :flags
			t.boolean :reverse
			t.string :reference
			t.string :chromosome
			t.integer :position
			t.string :cigar
			t.integer :length_m
			t.integer :length_all
			t.float :percent_m

			t.index :sequence
			t.index :reference
			t.index :chromosome
			t.index :position
			t.index :percent_m

			t.timestamps
		end
	end
end
