require 'table_print'
require '../src/waveform.rb'
require '../src/dft.rb'
require '../src/profile.rb'

START_SIZE   = 8
END_SIZE     = 11

constant     = 1
results      = []

(START_SIZE..END_SIZE).each do |v|
    size            = 2 ** v
    input           = Waveform.sin 1, size
    start_time      = Time.now
    Profile.start
    DFT.compute input
    elapsed, memory = Profile.stop
    constant        = elapsed / (size * size) if v == START_SIZE
    computed        = size * size * constant
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
