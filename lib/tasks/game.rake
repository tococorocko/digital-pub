namespace :game do
  desc "Fetches the 10 most recent scheduled games"
  task fetch: :environment do
    puts 'Fetching games for Premier League'
    ApiCallJob.set(wait: 1.minute).perform_later("SA", 4, 10)
    puts 'Finished'

    puts 'Fetching games for Bundesliga'
    ApiCallJob.set(wait: 1.minute).perform_later("BL1", 3, 10)
    puts 'Finished'

    puts 'Fetching games for La Liga'
    ApiCallJob.set(wait: 1.minute).perform_later("PD", 1, 10)
    puts 'Finished'

    puts 'Fetching games for Serie A'
    ApiCallJob.set(wait: 1.minute).perform_later("PL", 2, 10)
    puts 'Finished'
  end

end
