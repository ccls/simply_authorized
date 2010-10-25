Factory.define :role do |f|
	f.sequence(:name) { |n| "name#{n}" }
end

Factory.define :user do |f|
	f.sequence(:uid) { |n| "UID#{n}" }
#	f.sequence(:username) { |n| "username#{n}" }
#	f.sequence(:email) { |n| "username#{n}@example.com" }
#	f.password 'V@1!dP@55w0rd'
#	f.password_confirmation 'V@1!dP@55w0rd'
#	f.role_name 'user'
end
Factory.define :admin_user, :parent => :user do |f|
	f.administrator true
end	#	parent must be defined first
