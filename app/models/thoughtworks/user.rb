module ThoughtWorks
  class User < OpenStruct
    def self.find identifier
      new(name: 'Name', id: identifier, email: 'a@b.com')
    end
  end
end