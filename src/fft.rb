require '../src/roots.rb'

module FFT

    def self.compute v
        
        return v if v.size == 1

        e = (compute (0...v.size).step(2).map { |i| v[i] }) * 2
        o = (compute (1...v.size).step(2).map { |i| v[i] }) * 2

        e.each_with_index.map { |_,i| e[i] + o[i] * (Roots.get -i, v.size) }

    end
        
end
