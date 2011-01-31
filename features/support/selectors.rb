module SelectorHelpers
  # Maps a name to a selector object.
  
  def to_selector(from)
    selector_name = Cukestone::Conf.selectors.keys.detect {| selectors | Regexp.new(selectors).match(from)}
    if not selector_name.nil? then
      Cukestone::Conf.selectors[selector_name]
     else       
      # if we can't find a mapping, just return the name that was to be mapped
      from    
    end
  end   
end

World(SelectorHelpers)

