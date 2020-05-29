#PAGINA 3: THE UNIVERSE ATLAS, MELODIA/ARMONIA SECUNDARIA
use_real_time
live_loop :keysb do
  with_fx   :rlpf do
    with_fx :normaliser do
      with_fx :level, amp: 10 do
        
        #definir bpm
        with_bpm 70 do
          
          #sintes de armonia y melodia
          harmoniab = :mod_fm
          melodyb = :hollow
          
          #aceptar el midi in del teclado
          keya, keyb = sync "/midi/akai_mpk25/0/1/note_on"
          
          #C#m7
          if keya == 53
            use_synth harmoniab
            with_fx :reverb do
            play_chord [41, 45, 48, 52, 55] end
            with_fx :distortion, amp: 0.25 do
              with_fx :gverb, amp: 1.5 do
                use_synth melodyb
                play :d6, amp: 0.8
                sleep 1
                use_synth melodyb
                play :c6, amp: 0.6
                sleep 2
                use_synth melodyb
                play :c6, amp: 0.5
                sleep 0.333333
                use_synth melodyb
                play :d6, amp: 0.7
                sleep 0.333333333
                use_synth melodyb
                play :c6, amp: 0.6
            sleep 0.333333 end end
            use_synth harmoniab
            play_chord [45, 49, 52, 56]
            with_fx :distortion, amp: 0.25 do
              use_synth melodyb
              play :a6, amp: 0.8
          sleep 3 end end
          
          #D#maj7 - C
          if keya == 51
            use_synth harmoniab
            with_fx :reverb do
            play_chord [15, 39, 43, 46, 50] end
            use_synth :dtril
            play_chord [3, 15]
            with_fx :distortion, amp: 0.25 do
              with_fx :gverb, amp: 1.5 do
                use_synth melodyb
                play :a6, amp: 0.8
                sleep 1
                use_synth melodyb
                play :g6, amp: 0.6
                sleep 2
                use_synth melodyb
                play :a6, amp: 0.5
                sleep 0.333333
                use_synth melodyb
                play :g6, amp: 0.7
                sleep 0.333333333
                use_synth melodyb
                play :a6, amp: 0.6
            sleep 0.333333 end end
            use_synth harmoniab
            play_chord [45, 49, 52, 56]
            with_fx :distortion, amp: 0.25 do
              use_synth melodyb
              play :a6, amp: 0.8
          sleep 3 end end
          
          #D#maj7 - G#
          if keya == 56
            use_synth harmoniab
            with_fx :reverb do
            play_chord [15, 39, 43, 46, 50] end
            use_synth :dtril
            play_chord [3, 15]
            with_fx :distortion, amp: 0.25 do
              with_fx :gverb, amp: 1.5 do
                use_synth melodyb
                play :a6, amp: 0.8
                sleep 1
                use_synth melodyb
                play :g6, amp: 0.6
                sleep 2
                use_synth melodyb
                play :a6, amp: 0.5
                sleep 0.333333
                use_synth melodyb
                play :g6, amp: 0.7
                sleep 0.333333333
                use_synth melodyb
                play :a6, amp: 0.6
                sleep 0.333333
                use_synth harmoniab
                play_chord [32, 37, 39, 42]
                use_synth :dtri
                play_chord [15, 27]
                sleep 2
                use_synth harmoniab
                play_chord [32, 37, 39, 43]
                use_synth :dtri
                play_chord [15, 3]
                play :a6, amp: 0.8
        end end end end
        
      end
    end
  end
end