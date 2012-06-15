class Badge < ActiveRecord::Base
  has_many :badges_sashes

  validates :name, :presence => true

  # Grant badge to sash
  def grant_to(object_or_sash)
    object_or_sash.create_sash_if_none unless object_or_sash.kind_of?(Sash)
    sash = object_or_sash.respond_to?(:sash) ? object_or_sash.sash : object_or_sash
    sash.add_badge(id)
    return true
  end

  # Take out badge from sash
  def delete_from(object_or_sash)
    object_or_sash.create_sash_if_none unless object_or_sash.kind_of?(Sash)
    sash = object_or_sash.respond_to?(:sash) ? object_or_sash.sash : object_or_sash
    if sash.badge_ids.include?(id)
      sash.rm_badge(id)
      return true
    else
      return false
    end
  end

end

puts "WTF"