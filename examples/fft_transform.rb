require 'table_print'
require '../src/waveform.rb'
require '../src/fft.rb'
require '../src/utils.rb'
require '../src/print_utils.rb'

input = Waveform.sin ARGV.first.to_f, 16
xform = Utils.complex_to_real (FFT.compute input)

puts
puts 'SIGNAL:'
puts
tp input.each_with_index.map { |v,i| { 'index' => i, 'value' => (PrintUtils.sig v) } }

puts
puts 'TRANSFORM:'
puts
tp xform.each_with_index.map { |v,i| { 'index' => i, 'value' => (PrintUtils.trans v) } }
puts
