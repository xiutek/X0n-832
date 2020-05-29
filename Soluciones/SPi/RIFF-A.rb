16.times do
  sample :loop_amen, beat_stretch:3.3
  sleep sample_duration :loop_amen
  with_fx :flanger, feedback:0.3 do
    with_fx :hpf, cutoff: 95 do
      sample :loop_amen, beat_stretch:6
      sleep sample_duration :loop_amen
    end
  end
end

######## PIANITO #########

with_fx :panslicer do
  with_fx :wobble do
    with_fx :hpf,cutoff: 80 do
      start_notes = ring(60, 62, 63, 62)
      loop do
        my_chord = chord(start_notes.tick, :M7)
        play my_chord, release: 2
        4.times do
          play my_chord.choose
          sleep 0.333
        end
      end
    end
  end
end