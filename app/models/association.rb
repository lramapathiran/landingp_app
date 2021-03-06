class Association < ActiveRecord::Base

		has_one :localisation, as: :localisable

    validates :last_name, presence: true
		validates :email, presence: true
		validates :time, presence: true
		validates :address, presence: true
		validates :phone, presence: true
		validates :description, presence: true
		validates :besoins, presence: true

    # Association.create_with_address(params)
    def self.create_with_address(params)
      association = Association.new(params[:association])
      association.localisation = Localisation.create_from(params[:address])
      association.save
      association
    end    

    def position
      if localisation
        localisation.position
      end
    end
end
		
