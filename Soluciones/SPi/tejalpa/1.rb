#PAGINA 2: UNIVERSE ATLAS, MELODIA/ARMONIA PRINCIPAL
use_real_time
live_loop :keys do
  with_fx   :rlpf do
    with_fx :normaliser do
      with_fx :level, amp: 10 do
        
        #definir bpm
        with_bpm 70 do
          
          #sintes de armonia y melodia
          harmonia = :dtri
          melody = :hollow
          
          #aceptar el midi in del teclado
          keya, keyb = sync "/midi/akai_mpk25/0/1/note_on"
          
          #C#m7
          if keya == 49
            use_synth harmonia
            with_fx :reverb do
            play_chord [49, 52, 56, 59] end
            with_fx :distortion, amp: 0.25 do
              with_fx :gverb, amp: 1.5 do
                use_synth melody
                play :gs5, amp: 0.8
                sleep 0.333
                use_synth melody
                play :gs5, amp: 0.6
                sleep 0.333
                use_synth melody
                play :gs5, amp: 0.5
                sleep 0.333
                use_synth melody
                play :gs5, amp: 0.7
                sleep 0.333
                use_synth melody
                play :e5, amp: 0.6
                sleep 0.333
                use_synth melody
                play :cs5, amp: 0.4
            sleep 0.333 end end
            use_synth harmonia
            play_chord [37, 49, 52, 56, 59]
            with_fx :distortion, amp: 0.25 do
              use_synth melody
              play :gs5, amp: 0.8
              sleep 0.333
              use_synth melody
              play :gs5, amp: 0.6
              sleep 0.333
              use_synth melody
              play :gs5, amp: 0.5
              sleep 0.333
              use_synth melody
              play :gs5, amp: 0.7
              sleep 0.333
              use_synth melody
              play :e5, amp: 0.6
              sleep 0.333
              use_synth melody
              play :cs5, amp: 0.3
            end
          end
          
          #Bm7
          if keya == 59
            use_synth harmonia
            with_fx :reverb do
            play_chord [47, 50, 54 ,57] end
            with_fx :distortion, amp: 0.25 do
              use_synth melody
              play :gs5, amp: 0.5
              sleep 0.333
              use_synth melody
              play :gs5, amp: 0.6
              sleep 0.333
              use_synth melody
              play :gs5, amp: 0.7
              sleep 0.333
              use_synth melody
              play :gs5, amp: 0.8
              sleep 0.333
              use_synth melody
              play :d5, amp: 0.6
              sleep 0.333
              use_synth melody
              play :b4, amp: 0.55
            sleep 0.333 end
            use_synth harmonia
            play_chord [35, 47, 50, 54 ,57]
            with_fx :distortion, amp: 0.25 do
              use_synth melody
              play :gs5, amp: 0.7
              sleep 0.333
              use_synth melody
              play :gs5, amp: 0.8
              sleep 0.333
              use_synth melody
              play :gs5, amp: 0.8
              sleep 0.333
              use_synth melody
              play :gs5, amp: 0.9
              sleep 0.333
              use_synth melody
              play :d5, amp: 0.7
              sleep 0.333
              use_synth melody
              play :b4, amp: 0.6
            end
          end
          
          #Amaj7 45, 49, 52, 58
          if keya == 57
            use_synth harmonia
            with_fx :echo, amp: 1.5 do
            play_chord [45, 49, 52, 56] end
            with_fx :distortion, amp: 0.25 do
              with_fx :echo, amp: 3 do
                use_synth melody
                play :gs5, amp: 0.8
                sleep 0.333
                use_synth melody
                play :gs5, amp: 0.6
                sleep 0.333
                use_synth melody
                play :gs5, amp: 0.7
                sleep 0.333
                use_synth melody
                play :gs5, amp: 0.8
                sleep 0.333
                use_synth melody
                play :e5, amp: 0.6
                sleep 0.333
                use_synth melody
                play :a4, amp: 0.55
            sleep 0.333 end end
            use_synth harmonia
            play_chord [33, 45, 49, 52, 56]
            with_fx :distortion, amp: 0.25 do
              use_synth melody
              play :gs5, amp: 0.8
              sleep 0.333
              use_synth melody
              play :gs5, amp: 0.8
              sleep 0.333
              use_synth melody
              play :gs5, amp: 0.9
              sleep 0.333
              use_synth melody
              play :gs5, amp: 0.8
              sleep 0.333
              use_synth melody
              play :e5, amp: 0.7
              sleep 0.333
              use_synth melody
              play :a4, amp: 0.6
            end
          end
          
          #Gmaj7 42, 47, 50, 55
          if keya == 55
            use_synth harmonia
            play_chord [42, 47, 50, 55]
            with_fx :distortion, amp: 0.25 do
              use_synth melody
              play :g5, amp: 0.3
              sleep 0.333
              use_synth melody
              play :g5, amp: 0.4
              sleep 0.333
              use_synth melody
              play :g5, amp: 0.5
              sleep 0.333
              use_synth melody
              play :g5, amp: 0.6
              sleep 0.333
              use_synth melody
              play :e5, amp: 0.4
              sleep 0.333
              use_synth melody
              play :a4, amp: 0.5
            sleep 0.333 end
            use_synth harmonia
            play_chord [30, 42, 47, 50, 55]
            with_fx :distortion, amp: 0.25 do
              with_fx :echo, amp: 0.2 do
                use_synth melody
                play :g5, amp: 0.6
                sleep 0.333
                use_synth melody
                play :g5, amp: 0.7
                sleep 0.333
                use_synth melody
                play :g5, amp: 0.8
                sleep 0.333
                use_synth melody
                play :g5, amp: 0.8
                sleep 0.333
                use_synth melody
                play :e5, amp: 0.7
                sleep 0.333
                use_synth melody
                play :b4, amp: 0.9
                
            end end
          end
        end
      end
    end
  end
end