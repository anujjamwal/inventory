module ThoughtWorks
  class User < OpenStruct
    def self.find identifier
      new(name: 'Name', id: identifier, email: 'a@b.com', ad_id: 'adid')
    end
  end
end