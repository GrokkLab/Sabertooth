namespace :schema do

  desc "create schema"
  task :create => %w{ environment db:load_config } do
    begin
      config = ActiveRecord::Base.configurations[::Rails.env]
      ActiveRecord::Base.establish_connection

      schema_name = ENV["SCHEMA_NAME"] || "default"

      sql = %{CREATE SCHEMA "#{schema_name}"}
      ActiveRecord::Base.connection.execute sql
      puts "Created schema #{schema_name}."
    end
  end

  desc "drop schema"
  task :drop => %w{ environment db:load_config } do
    begin
      config = ActiveRecord::Base.configurations[::Rails.env]
      ActiveRecord::Base.establish_connection

      schema_name = ENV["SCHEMA_NAME"] || "default"

      sql = %{DROP SCHEMA IF EXISTS "#{schema_name}" CASCADE}
      ActiveRecord::Base.connection.execute sql
      puts "Dropped schema #{schema_name}."
    end
  end

  desc "migrate schema"
  task :migrate => %w{ environment db:load_config } do
    begin
      config = ActiveRecord::Base.configurations[::Rails.env]
      ActiveRecord::Base.establish_connection

      schema_name = ENV["SCHEMA_NAME"] || "default"

      ActiveRecord::Base.connection.schema_search_path = schema_name

      verbose = ENV["VERBOSE"] ? ENV["VERBOSE"] == "true" : true
      ActiveRecord::Migration.verbose = verbose

      version = ENV["VERSION"] ? ENV["VERSION"].to_i : nil
      ActiveRecord::Migrator.migrate("db/migrate/", version)

      puts "Migrated schema #{schema_name}."
    end
  end

  desc "seed schema"
  task :seed => %w{ environment db:load_config } do
    begin
      config = ActiveRecord::Base.configurations[::Rails.env]
      ActiveRecord::Base.establish_connection

      schema_name = ENV["SCHEMA_NAME"] || "default"

      ActiveRecord::Base.connection.schema_search_path = schema_name

      Rake::Task['db:seed'].invoke

      puts "Seeded schema #{schema_name}."
    end
  end

  desc "reset schema"
  task :reset => [:drop, :create, :migrate, :seed] do
    schema_name = ENV["SCHEMA_NAME"] || "default"
    puts "Reset schema #{schema_name}."
  end
end