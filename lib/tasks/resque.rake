 # Resque tasks
require 'resque/tasks'
require 'resque/scheduler/tasks'
require 'resque/pool/tasks'


namespace :resque do
  task setup: :environment do
    require 'resque'
    Resque.redis = Redis.new(YAML.load_file(File.join(Rails.root, '/config/redis.yml')))
  end

  task setup_schedule: :setup do
    require 'resque-scheduler'
    yaml_schedule = YAML.load_file(File.join(Rails.root, '/config/resque_schedule.yml'))
    wrapped_schedule = ActiveScheduler::ResqueWrapper.wrap yaml_schedule
    Resque.schedule  = wrapped_schedule
  end


	task "resque:pool:setup" do
	  Resque::Pool.after_prefork do |job|
	    Resque.redis.client.reconnect
	  end
	end

  task scheduler: :setup_schedule
end
