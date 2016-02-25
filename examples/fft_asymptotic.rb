require 'table_print'
require '../src/waveform.rb'
require '../src/fft.rb'
require '../src/profile.rb'

START_SIZE   = 12
END_SIZE     = 17

constant     = 1
results      = []

(START_SIZE..END_SIZE).each do |v|
    size            = 2 ** v
    input           = Waveform.sin 1, size
    start_time      = Time.now
    Profile.start
    FFT.compute input
    elapsed, memory = Profile.stop
    constant        = elapsed / size / (Math::log size) if v == START_SIZE
    computed        = size * (Math::log size) * constant
    diff            = 100 * (computed - elapsed).abs / computed
    results         << { 'points'             => size, 
                         'actual time'        => elapsed.round(2), 
                         'predicted time'     => computed.round(2), 
                         'percent time error' => diff.round(1),
                         'points per second'  => (size / elapsed).round(0) }
end

puts
tp results
puts
