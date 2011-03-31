module SimplyAuthorized
module UserModel

	def self.included(base)
		base.extend(PrepMethod)
#		base.send(:include, InstanceMethods)
#		base.class_eval do
#			alias_method_chain :reset_persistence_token, :uniqueness
#		end
	end

	module PrepMethod
		def simply_authorized(options={})

			include SimplyAuthorized::UserModel::InstanceMethods
			extend  SimplyAuthorized::UserModel::ClassMethods

			has_and_belongs_to_many :roles,  :uniq => true, 
				:before_add => :before_add_role,
				:after_add  => :after_add_role,
				:before_remove => :before_remove_role,
				:after_remove  => :after_remove_role

		end
		alias_method :authorized, :simply_authorized
	end

	module ClassMethods

#		def search(options={})
#			conditions = {}
#			includes = joins = []
#			if !options[:role_name].blank?
#				includes = [:roles]
#				if Role.all.collect(&:name).include?(options[:role_name])
#					joins = [:roles]
#					conditions = ["roles.name = '#{options[:role_name]}'"]
#		#		else
#		#			@errors = "No such role '#{options[:role_name]}'"
#				end 
#			end 
#			self.all( 
#				:joins => joins, 
#				:include => includes,
#				:conditions => conditions )
#		end 

	end

	module InstanceMethods

		def before_add_role(role)
		end

		def after_add_role(role)
		end

		def before_remove_role(role)
		end

		def after_remove_role(role)
		end

		def role_names
			roles.collect(&:name).uniq
		end

		def deputize
			roles << Role.find_or_create_by_name('administrator')
		end

		#	The 4 common CCLS roles are ....
		def is_superuser?(*args)
			self.role_names.include?('superuser')
		end
		alias_method :is_super_user?, :is_superuser?

		def is_administrator?(*args)
			self.role_names.include?('administrator')
		end

		def is_editor?(*args)
			self.role_names.include?('editor')
		end

		def is_interviewer?(*args)
			self.role_names.include?('interviewer')
		end

		def is_reader?(*args)
			self.role_names.include?('reader')
		end

		def is_user?(user=nil)
			!user.nil? && self == user
		end
		alias_method :may_be_user?, :is_user?

		def may_administrate?(*args)
			(self.role_names & ['superuser','administrator']).length > 0
		end
		alias_method :may_view_permissions?,        :may_administrate?
		alias_method :may_create_user_invitations?, :may_administrate?
		alias_method :may_view_users?,              :may_administrate?
		alias_method :may_assign_roles?,            :may_administrate?

		def may_edit?(*args)
			(self.role_names & 
				['superuser','administrator','editor']
			).length > 0
		end
		alias_method :may_maintain_pages?, :may_edit?


#	Add tests for may_interview and may_read
		def may_interview?(*args)
			(self.role_names & 
				['superuser','administrator','editor','interviewer']
			).length > 0
		end

#	This is pretty lame as all current roles can read
		def may_read?(*args)
			(self.role_names & 
				['superuser','administrator','editor','interviewer','reader']
			).length > 0
		end
		alias_method :may_view?, :may_read?



		def may_view_user?(user=nil)
			self.is_user?(user) || self.may_administrate?
		end




		def may_share_document?(document=nil)
			document && ( 
				self.is_administrator? ||
				( document.owner && self == document.owner ) 
			)
		end

		def may_view_document?(document=nil)
			document





		end

	protected

	end

end
end
ActiveRecord::Base.send( :include, SimplyAuthorized::UserModel )
