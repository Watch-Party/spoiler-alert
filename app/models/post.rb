class Post < ApplicationRecord

  acts_as_votable

  validates_presence_of :content,
                        :time_in_episode

  belongs_to :user
  belongs_to :feed
  has_many :comments

  delegate :episode, :to => :feed, :allow_nil => true
  delegate :show, :to => :episode, :allow_nil => true

  after_create_commit { PostBroadcastWorker.perform_async self.id }

end
