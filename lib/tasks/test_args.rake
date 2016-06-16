task :test_args  => :environment do |t, args|
  args.with_defaults(:message => "Thanks for logging on")
  puts "Hello #{args} #{args.message}"
end