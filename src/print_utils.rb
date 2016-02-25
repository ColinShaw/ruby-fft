module PrintUtils

    def self.sig x
        ' ' * ((8 * x).to_i + 8) + '*'
    end

    def self.trans x
        '*' * 2 * x.to_i
    end

end
