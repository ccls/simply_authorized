module SimplyAuthorized;end
namespace :test do
	namespace :units do
		Rake::TestTask.new(:simply_authorized => "db:test:prepare") do |t|
			t.pattern = File.expand_path(File.join(
				File.dirname(__FILE__),'/../../test/unit/authorized/*_test.rb'))
			t.libs << "test"
			t.verbose = true
		end
	end
	namespace :functionals do
		Rake::TestTask.new(:simply_authorized => "db:test:prepare") do |t|
			t.pattern = File.expand_path(File.join(
				File.dirname(__FILE__),'/../../test/functional/authorized/*_test.rb'))
			t.libs << "test"
			t.verbose = true
		end
	end
end
Rake::Task['test:functionals'].prerequisites.unshift(
	"test:functionals:simply_authorized" )
Rake::Task['test:units'].prerequisites.unshift(
	"test:units:simply_authorized" )

#	I thought of possibly just including this file
#	but that would make __FILE__ different.
#	Hmmm

@gem_test_dirs ||= []
@gem_test_dirs << File.expand_path(File.join(File.dirname(__FILE__),
	'/../../test/unit/authorized/'))
@gem_test_dirs << File.expand_path(File.join(File.dirname(__FILE__),
	'/../../test/functional/authorized/'))

