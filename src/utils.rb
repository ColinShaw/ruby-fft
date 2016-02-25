module Utils

    def self.complex_to_real data
        data.map { |d| d.magnitude }[0...(data.size/2)]
    end

end
