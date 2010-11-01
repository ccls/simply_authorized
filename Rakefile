require(File.join(File.dirname(__FILE__), 'config', 'boot'))

require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'

desc 'Generate documentation for the gem.'
Rake::RDocTask.new(:rdoc) do |rdoc|
	rdoc.rdoc_dir = 'rdoc'
	rdoc.title		= 'Simply Authorized'
	rdoc.options << '--line-numbers' << '--inline-source'
	rdoc.rdoc_files.include('README.rdoc')
	rdoc.rdoc_files.include('lib/**/*.rb')
end

require 'tasks/rails'

begin
	require 'jeweler'
	Jeweler::Tasks.new do |gem|
		gem.name = "jakewendt-simply_authorized"
		gem.summary = %Q{one-line summary of your gem}
		gem.description = %Q{longer description of your gem}
		gem.email = "github@jake.otherinbox.com"
		gem.homepage = "http://github.com/jakewendt/simply_authorized"
		gem.authors = ["George 'Jake' Wendt"]
		# gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings

		gem.files  = FileList['config/routes.rb']
		gem.files += FileList['app/**/*.rb']
		gem.files += FileList['app/**/*.erb']
		gem.files += FileList['lib/**/*.rb']
		gem.files += FileList['lib/**/*.rake']
		gem.files += FileList['generators/**/*']
		gem.files -= FileList['**/versions/*']
#
#	I'm not quite sure if it matters whether these files
#	are included as 'files' or 'test_files', but
#	they need to be included if I'm gonna use'em.
#
		gem.test_files = FileList['test/**/*.rb']

		gem.add_dependency('rails', '~> 2')
		gem.add_dependency('jakewendt-simply_helpful')
		gem.add_dependency('jakewendt-ruby_extension')
		gem.add_dependency('ryanb-acts-as-list')
#		gem.add_dependency('thoughtbot-factory_girl')
#		gem.add_dependency('jakewendt-assert_this_and_that')
		gem.add_dependency('jakewendt-calnet_authenticated')
	end
	Jeweler::GemcutterTasks.new
rescue LoadError
	puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end
#       From `script/generate calnet_authenticated` ...
require 'calnet_authenticated/test_tasks'
