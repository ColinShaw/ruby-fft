module Roots

    @@values = {} 
 
    def self.get num, den
        idx = (Rational num, den) % 1
        @@values[idx] ||= compute idx
    end
    
    def self.compute x 
        arg = 2.0 * Math::PI * x.to_f
        Complex (Math::cos arg), (Math::sin arg)
    end 
    
end
