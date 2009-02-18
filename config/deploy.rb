set :application, "jibber"

# If you aren't deploying to /u/apps/#{application} on the target
# servers (which is the default), you can specify the actual location
# via the :deploy_to variable:
set :deploy_to, "/home/bob/apps/#{application}"

# If you aren't using Subversion to manage your source code, specify
# your SCM below:
set :scm, :git
set :repository, "git@github.com:boblmartens/jibber.git"
set :branch, "master"

set :user, 'bob'

role :app, "bobmartens.net"
role :web, "bobmartens.net"
role :db,  "bobmartens.net", :primary => true

namespace :deploy do
  desc "Restarting mod_rails with restart.txt"
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{current_path}/tmp/restart.txt"
  end

  [:start, :stop].each do |t|
    desc "#{t} task is a no-op with mod_rails"
    task t, :roles => :app do ; end
  end
end

desc "Link to database"
task :link_db do
  run "ln -s /home/bob/apps/jibber/db/production.sqlite3 /home/bob/apps/jibber/current/db/production.sqlite3"
end

after "deploy", "link_db"
after "deploy", "deploy:cleanup"
#after "deploy", "deploy:migrate"
