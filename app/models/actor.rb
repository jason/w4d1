class Actor < ActiveRecord::Base
  set_table_name(:actor)
  set_primary_key(:actor_id)
  has_many :film_actors
  has_many :films, :through => :film_actors
  has_many :film_categories
  has_many :categories, :through => :films


  def self.most_films
    self
    .select("Actor.first_name, Actor.last_name, COUNT(*) AS film_count")
    .joins(:film_actors)
    .group("actor.actor_id")
    .order("film_count DESC")
    .limit(10)
  end

end

