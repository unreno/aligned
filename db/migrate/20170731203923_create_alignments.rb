class CreateAlignments < ActiveRecord::Migration[5.1]
	def change
		create_table :alignments do |t|
			t.string :sequence
			t.integer :flags
			t.boolean :reverse
			t.string :reference
			t.string :chromosome
			t.integer :position
			t.string :cigar				#, limit: 1024
			t.integer :length_eq
			t.integer :length_all
			t.float :percent_eq
			t.integer :edit_distance
			t.float :percent_ed

			t.index :sequence
			t.index :reference
			t.index :chromosome
			t.index :position
			t.index :percent_eq
			t.index :percent_ed

			t.timestamps
		end
	end
end
