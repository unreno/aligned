class CreateAlignments < ActiveRecord::Migration[5.1]
	def change
		create_table :alignments do |t|
			t.string :sequence
			t.integer :flags
			t.string :reference
			t.string :chromosome
			t.integer :position
			t.string :cigar

			t.index :sequence
			t.index :reference
			t.index :chromosome
			t.index :position

			t.timestamps
		end
	end
end