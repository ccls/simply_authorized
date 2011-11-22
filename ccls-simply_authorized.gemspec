# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{ccls-simply_authorized}
  s.version = "1.4.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["George 'Jake' Wendt"]
  s.date = %q{2011-11-21}
  s.description = %q{longer description of your gem}
  s.email = %q{github@jakewendt.com}
  s.extra_rdoc_files = [
    "README.rdoc"
  ]
  s.files = [
    "app/models/role.rb",
    "generators/ccls_simply_authorized/USAGE",
    "generators/ccls_simply_authorized/ccls_simply_authorized_generator.rb",
    "generators/ccls_simply_authorized/templates/autotest_simply_authorized.rb",
    "generators/ccls_simply_authorized/templates/controllers/roles_controller.rb",
    "generators/ccls_simply_authorized/templates/fixtures/roles.yml",
    "generators/ccls_simply_authorized/templates/functional/roles_controller_test.rb",
    "generators/ccls_simply_authorized/templates/migrations/create_roles.rb",
    "generators/ccls_simply_authorized/templates/migrations/create_roles_users.rb",
    "generators/ccls_simply_authorized/templates/simply_authorized.rake",
    "generators/ccls_simply_authorized/templates/stylesheets/authorized.css",
    "generators/ccls_simply_authorized/templates/unit/role_test.rb",
    "lib/ccls-simply_authorized.rb",
    "lib/simply_authorized.rb",
    "lib/simply_authorized/authorization.rb",
    "lib/simply_authorized/autotest.rb",
    "lib/simply_authorized/controller.rb",
    "lib/simply_authorized/core_extension.rb",
    "lib/simply_authorized/factories.rb",
    "lib/simply_authorized/factory_test_helper.rb",
    "lib/simply_authorized/helper.rb",
    "lib/simply_authorized/permissive_controller.rb",
    "lib/simply_authorized/resourceful_controller.rb",
    "lib/simply_authorized/tasks.rb",
    "lib/simply_authorized/test_tasks.rb",
    "lib/simply_authorized/user_model.rb",
    "lib/tasks/application.rake",
    "lib/tasks/common_lib.rake",
    "lib/tasks/database.rake",
    "lib/tasks/documentation.rake",
    "lib/tasks/rcov.rake",
    "lib/tasks/simply_sessions.rake",
    "rails/init.rb"
  ]
  s.homepage = %q{http://github.com/ccls/simply_authorized}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.6.2}
  s.summary = %q{one-line summary of your gem}
  s.test_files = ["test/unit/authorized/role_test.rb"]

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails>, ["~> 2"])
      s.add_runtime_dependency(%q<ccls-common_lib>, [">= 0"])
      s.add_runtime_dependency(%q<ryanb-acts-as-list>, [">= 0"])
    else
      s.add_dependency(%q<rails>, ["~> 2"])
      s.add_dependency(%q<ccls-common_lib>, [">= 0"])
      s.add_dependency(%q<ryanb-acts-as-list>, [">= 0"])
    end
  else
    s.add_dependency(%q<rails>, ["~> 2"])
    s.add_dependency(%q<ccls-common_lib>, [">= 0"])
    s.add_dependency(%q<ryanb-acts-as-list>, [">= 0"])
  end
end

