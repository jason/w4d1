class Category < ActiveRecord::Base
  set_table_name(:category)
  set_primary_key(:category_id)
  has_many :film_categories
  has_many :films, through: :film_categories
  has_many :actors, through: :films

  def self.largest_category
    self
      .select("Category.name, COUNT(*) AS cat_count")
      .joins(:film_categories)
      .group("category.category_id")
      .order("cat_count DESC")
      .limit(10)
  end
end