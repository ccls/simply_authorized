class SimplyAuthorizedGenerator < Rails::Generator::Base

	def manifest
		#	See Rails::Generator::Commands::Create
		#	rails-2.3.10/lib/rails_generator/commands.rb
		#	for code methods for record (Manifest)
		record do |m|

			#	The autotest file will require that the app actually 
			#		looks for autotest files.
			m.directory('config/autotest')
			m.file('autotest_simply_authorized.rb', 'config/autotest/simply_authorized.rb')

			#	*.rake files in the lib/tasks/ directory are automatically
			#		loaded so nothing is required to include this.
			m.directory('lib/tasks')
			m.file('simply_authorized.rake', 'lib/tasks/simply_authorized.rake')

			%w( create_roles create_roles_users ).each do |migration|
				m.migration_template "migrations/#{migration}.rb",
					'db/migrate', :migration_file_name => migration
			end
			dot = File.dirname(__FILE__)
			m.directory('public/javascripts')
			Dir["#{dot}/templates/javascripts/*js"].each{|file| 
				f = file.split('/').slice(-2,2).join('/')
				m.file(f, "public/javascripts/#{File.basename(file)}")
			}
			m.directory('public/stylesheets')
			Dir["#{dot}/templates/stylesheets/*css"].each{|file| 
				f = file.split('/').slice(-2,2).join('/')
				m.file(f, "public/stylesheets/#{File.basename(file)}")
			}

#			Dir["#{dot}/templates/app/views/*/**/"].each do |dir|
#				last_dir = dir.split('/').last
#				m.directory("app/views/#{last_dir}")
#				Dir["#{dot}/templates/views/#{last_dir}/*rb"].each do |file|
#					f = file.split('/').slice(-3,3).join('/')
#					m.file(f, "app/views/#{last_dir}/#{File.basename(file)}")
#				end
#			end

			m.directory('app/controllers')
			Dir["#{dot}/templates/controllers/*rb"].each{|file| 
				f = file.split('/').slice(-2,2).join('/')
				m.file(f, "app/controllers/#{File.basename(file)}")
			}
			m.directory('test/functional/simply_authorized')
			Dir["#{dot}/templates/functional/*rb"].each{|file| 
				f = file.split('/').slice(-2,2).join('/')
				m.file(f, "test/functional/simply_authorized/#{File.basename(file)}")
			}

			m.directory('test/fixtures')
			Dir["#{dot}/templates/fixtures/*yml"].each{|file| 
				f = file.split('/').slice(-2,2).join('/')
				m.file(f, "test/fixtures/#{File.basename(file)}")
			}

#			m.directory('test/unit/authorized')
#			Dir["#{dot}/templates/unit/*rb"].each{|file| 
#				f = file.split('/').slice(-2,2).join('/')
#				m.file(f, "test/unit/authorized/#{File.basename(file)}")
#			}
		end
	end

end
module Rails::Generator::Commands
	class Create
		def migration_template(relative_source, 
				relative_destination, template_options = {})
			migration_directory relative_destination
			migration_file_name = template_options[
				:migration_file_name] || file_name
			if migration_exists?(migration_file_name)
				puts "Another migration is already named #{migration_file_name}: #{existing_migrations(migration_file_name).first}: Skipping" 
			else
				template(relative_source, "#{relative_destination}/#{next_migration_string}_#{migration_file_name}.rb", template_options)
			end
		end
	end #	Create
	class Base
	protected
		#	the loop through migrations happens so fast
		#	that they all have the same timestamp which
		#	won't work when you actually try to migrate.
		#	All the timestamps MUST be unique.
		def next_migration_string(padding = 3)
			@s = (!@s.nil?)? @s.to_i + 1 : if ActiveRecord::Base.timestamped_migrations
				Time.now.utc.strftime("%Y%m%d%H%M%S")
			else
				"%.#{padding}d" % next_migration_number
			end
		end
	end	#	Base
end
