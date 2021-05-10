require_relative './config/environment'



if ActiveRecord::Base.connection.migration_context.needs_migration?
    raise "Migrations are pending. Run rake db:migrate to resolve."
end
use Rack::MethodOverride
use SessionsController
run ApplicationController