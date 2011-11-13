class User < ActiveRecord::Base

	authorized

	validates_presence_of   :uid
	validates_uniqueness_of :uid

	def to_s
		displayname
	end

end
