class AddRefToVotes < ActiveRecord::Migration
  def change
  	
  	change_table :votes do |t|
	  	t.belongs_to :user
	  	t.belongs_to :movie
	  end

  	# reversible do |dir|
  	# 	dir.up do
	  # 		#add a foreign key
	  # 		execute <<-SQL
	  # 			ALTER TABLE votes
	  # 				ADD CONSTRAINT fk_votes_user
	  # 				FOREIGN KEY (user_id)
	  # 				REFERENCES user
	  # 		-SQL 
  	# 	end
	  # 	dir.down do
	  # 	end
	  # end
  end
end
