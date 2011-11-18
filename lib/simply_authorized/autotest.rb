class Autotest::Rails

#
#	Need both the mapping and the extra files
#
	def run_with_simply_authorized
		add_exception %r%config/%
		add_exception %r%versions/%
		add_exception %r%\.git/%
		self.extra_files << File.expand_path(File.join(
				File.dirname(__FILE__),'/../../test/unit/authorized/'))

#		self.extra_files << File.expand_path(File.join(
#				File.dirname(__FILE__),'/../../test/functional/authorized/'))
#
#		add_mapping( 
#			%r{^#{File.expand_path(File.join(File.dirname(__FILE__),'/../../test/'))}/(unit|functional)/authorized/.*_test\.rb$}
#			) do |filename, _|
#			filename
#		end

		add_mapping( 
			%r{^#{File.expand_path(File.join(File.dirname(__FILE__),'/../../test/'))}/unit/authorized/.*_test\.rb$}
			) do |filename, _|
			filename
		end

		run_without_simply_authorized
	end
	alias_method_chain :run, :simply_authorized


end
