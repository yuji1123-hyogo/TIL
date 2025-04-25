namespace :my do
  desc 'Show sample message'
  task :message, [:name] => :environment do |t, args|
    name = args[:name] || 'Rake task'
    puts "Hello, #{name}!"
  end
end
