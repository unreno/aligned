Rails.application.routes.draw do
	resources :alignments, only: :index
	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

	resources :statics, only: :index
#	resources :statics, :only => [:index] do
#		collection do
#			get :reports, :demographic_counts, :alters_per_ego,
#				:black_demographic_counts, :latina_demographic_counts, :trans_demographic_counts,
#				:leftover_demographic_counts, :sti_counts
#			#	puts app.reports_statics_path
#			#	=> /statics/reports
#		end
#	end

	root :to => "statics#index"

end
