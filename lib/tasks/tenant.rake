namespace :tenant do

  desc "create tenant"
  task :create => %w{ environment db:load_config } do
    begin
      config = ActiveRecord::Base.configurations[::Rails.env]
      ActiveRecord::Base.establish_connection

      tenant_name = ENV["TENANT_NAME"] || "default"

      sql = %{CREATE SCHEMA "#{tenant_name}"}
      ActiveRecord::Base.connection.execute sql
      puts "Created tenant #{tenant_name}."
    end
  end

  desc "drop tenant"
  task :drop => %w{ environment db:load_config } do
    begin
      config = ActiveRecord::Base.configurations[::Rails.env]
      ActiveRecord::Base.establish_connection

      tenant_name = ENV["TENANT_NAME"] || "default"

      sql = %{DROP SCHEMA IF EXISTS "#{tenant_name}" CASCADE}
      ActiveRecord::Base.connection.execute sql
      puts "Dropped tenant #{tenant_name}."
    end
  end

  desc "migrate tenant"
  task :migrate => %w{ environment db:load_config } do
    begin
      config = ActiveRecord::Base.configurations[::Rails.env]
      ActiveRecord::Base.establish_connection

      tenant_name = ENV["TENANT_NAME"] || "default"

      ActiveRecord::Base.connection.schema_search_path = tenant_name

      verbose = ENV["VERBOSE"] ? ENV["VERBOSE"] == "true" : true
      ActiveRecord::Migration.verbose = verbose

      version = ENV["VERSION"] ? ENV["VERSION"].to_i : nil
      ActiveRecord::Migrator.migrate("db/migrate/", version)

      puts "Migrated tenant #{tenant_name}."
    end
  end

  desc "seed tenant"
  task :seed => %w{ environment db:load_config } do
    begin
      config = ActiveRecord::Base.configurations[::Rails.env]
      ActiveRecord::Base.establish_connection

      tenant_name = ENV["TENANT_NAME"] || "default"

      ActiveRecord::Base.connection.schema_search_path = tenant_name

      Rake::Task['db:seed'].invoke

      puts "Seeded tenant #{tenant_name}."
    end
  end

  desc "reset tenant"
  task :reset => [:drop, :create, :migrate, :seed] do
    tenant_name = ENV["TENANT_NAME"] || "default"
    puts "Reset tenant #{tenant_name}."
  end
end