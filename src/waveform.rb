module Waveform
   
    def self.sin cycles, length
        Array.new(length).each_with_index.map do |_,i|
            Math::sin 2.0 * Math::PI * i * cycles / length
        end
    end

end
