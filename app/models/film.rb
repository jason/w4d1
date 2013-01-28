class Film < ActiveRecord::Base
  set_table_name(:film)
  set_primary_key(:film_id)
  has_many :film_actors
  has_many :actors, :through => :film_actors
  has_many :film_categories
  has_many :categories, :through => :film_categories
end