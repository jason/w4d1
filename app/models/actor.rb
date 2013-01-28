class Actor < ActiveRecord::Base
  set_table_name(:actor)
  set_primary_key(:actor_id)
  has_many :film_actors
  has_many :film_categories
  has_many :films, :through => :film_actors
  has_many :categories, through: :films

  def most_films
    self.each do |i|
      p i.films.count
    end

  end

end