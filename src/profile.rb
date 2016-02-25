module Profile
    
    def self.get_memory_usage
        `ps -o rss= -p #{Process.pid}`.to_i
    end

    def self.start
        @@memory = get_memory_usage
        @@time   = Time.now
    end

    def self.stop
        [Time.now - @@time, get_memory_usage - @@memory]
    end

end
