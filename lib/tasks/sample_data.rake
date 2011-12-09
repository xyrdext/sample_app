namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    admin = User.create!(:name => "Example User",
                 :email => "example@railstutorial.org",
                 :password => "foobar",
                 :password_confirmation => "foobar")
    admin.toggle!(:admin)
    1099.times do |n|
      User.create!(:name => Faker::Name.name,
                   :email => "example-#{n+1}@railstutorial.org",
                   :password => "password",
                   :password_confirmation => "password")
    end
  end
end