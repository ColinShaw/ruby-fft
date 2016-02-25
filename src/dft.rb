require '../src/roots.rb'

module DFT

    def self.compute v 
        res = []
        (0...v.size).each do |w|
            sum = 0
            (0...v.size).each do |i|
                sum += v[i] * (Roots.get -w * i, v.size)
            end 
            res << sum
        end
        res
    end

end
