class Film < ActiveRecord::Base
  set_table_name(:film)
  set_primary_key(:film_id)
  has_many :film_actors
  has_many :actors, :through => :film_actors
  has_many :film_categories
  has_many :categories, :through => :film_categories
  has_many :inventory
  has_many :stores, :through => :inventory


  def self.largest_cast
    self
      .select("Film.title, COUNT(*) AS cast_count")
      .joins(:film_actors)
      .group("film.film_id")
      .order("cast_count DESC")
      .limit(10)
  end

  def self.most_stores
    self
      .select("Film.title, COUNT(DISTINCT(store_id)) AS store_count")
      .joins(:inventory)
      .group("inventory.film_id")
      .order("store_count DESC")
      .limit(10)

  end

end

# SELECT Film.title, COUNT(DISTINCT(store_id)) AS store_count FROM film JOIN 
# nventory ON (film.film_id = inventory.film_id) GROUP BY film.film_id ORDER BY
# store_count DESC LIMIT 10;