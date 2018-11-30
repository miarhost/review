
namespace :user  do
  desc "create some fake data"
  task :fake_posts => :environment do
    num_posts = ENV['NUM_RECORDS'].to_i
    num_posts.times do
      Post.create(:title => Faker::Book.title,
                    :content => Faker::Movie.quote,
                      :author_ip => Faker::Internet.ip_v4_address)
    end
    print "#{num_posts} created.n"
  end
end