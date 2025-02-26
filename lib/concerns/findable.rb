module Concerns
  module Findable

    def find_by_name(name)
      all.detect{ |a| a.name == name }
    end

    def find_or_create_by_name(name)
      self.find_by_name(name) || create_by_name(name)
    end

    def create_by_name(name)
      self.create(name)
    end

  end
end
