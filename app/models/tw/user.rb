module TW
  class User < OpenStruct
      def self.find identifier
        new(name: 'Name', id: rand(20000), email: 'a@b.com', ad_id: identifier)
      end
  end
end