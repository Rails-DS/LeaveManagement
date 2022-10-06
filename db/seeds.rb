






teams = ["Development", "Support", "Marketing", "Design"]
teamleader = ["xxx", "yyy", "zzz", "AAA"]

teams.length.times do |x|
		Team.create!(
			teamName: teams[x],
			teamLeader: teamleader[x]
			)
end

puts "Teams Created.................!!!!!!!!!!"


roles = {"Jr.Developer" => 1,"Sr.Developer" => 1,"Jr.Tech-support" => 2, "Sr.Tech-support" => 2, "Business-analyst" => 3 , "UI/UX Designer" => 4}
roles.length.times do |y|
	Role.create!(
		roleName: roles.keys[y],
		team_id: roles.values[y]
		)
end

puts "Roles Created.........!!!!!!!!!"

# admin@admin.com admin
#shibu@gmail.com 1234


admin_user = User.create!(
	name: "admin",
	email: "admin@admin.com",
	password: "admin",
	password_confirmation: "admin",
	joiningDate: "01-06-2022",
	team_id: nil,
	role_id: nil, 
	is_admin: true
	)

puts "#{admin_user} created.............!!!!!!!!!" 

# User.create!(email: "admin@admin.com", password: "1234", password_confirmation: "1234", name: "admin", joiningDate: "12-6-1999", team_id: 1, role_id: 1, post: true)

