






teams = ["Development", "Support", "Marketing"]
teamleader = ["xxx", "yyy", "zzz"]

teams.length.times do |x|
		Team.create!(
			teamName: teams[x],
			teamLeader: teamleader[x]
			)
end

puts "Teams Created.................!!!!!!!!!!"


roles = {"Jr.Developer" => 1,"Sr.Developer" => 1,"Jr.Tech-support" => 2, "Sr.Tech-support" => 2, "Business-analyst" => 3 }
roles.length.times do |y|
	Role.create!(
		roleName: roles.keys[y],
		team_id: roles.values[y]
		)
end

puts "Roles Created.........!!!!!!!!!"