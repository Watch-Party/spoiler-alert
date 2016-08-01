class LiveFeedWorker
  include Sidekiq::Worker

  def perform(episode_id)
    epi = Episode.find episode_id

    epi.feeds.create!(species: "live",
                      start_time: epi.air_date,
                      name: "live"
                      )

  end
end
