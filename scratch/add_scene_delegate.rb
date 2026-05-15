require 'xcodeproj'
project_path = 'ios/Runner.xcodeproj'
project = Xcodeproj::Project.open(project_path)
target = project.targets.find { |t| t.name == 'Runner' }
group = project.main_group.find_subpath('Runner', false)

unless group
  puts "Runner group not found"
  exit 1
end

file_name = 'SceneDelegate.swift'
file_ref = group.find_file_by_path(file_name)

if file_ref
  puts "#{file_name} already exists in project"
else
  file_ref = group.new_reference(file_name)
  target.add_file_references([file_ref])
  project.save
  puts "Added #{file_name} to project"
end
