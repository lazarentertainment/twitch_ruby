module PaginationRepresenter
  include Roar::Representer::JSON
  include Roar::Representer::Feature::Hypermedia
 
  property :_total
 
  link :self do |opts|
    page_url(opts[:model], :offset => current_offset)
  end
 
  link :next do |opts|
    page_url(opts[:model], :offset => next_offset) \
      if next_offset
  end
 
  link :previous do |opts|
    page_url(opts[:model], :offset => previous_offset) \
      if previous_offset
  end
 
  def items
    self
  end
 
  def page_url(*)
    raise "Implement me."
  end
end

