#PAGINA 1

############################
#### THE UNIVERSE ATLAS ####
#### COMPOSITOR: MIZRAIM####
## ARREGLO DIGITAL: XIUTEK##
## WHYSKY.TANGO.FOXTROT!####
############################


#MIDI PIANO BASE

use_real_time
live_loop :midi_piano do
  with_bpm 110 do
    with_fx :reverb do
      with_fx :level, amp: 10 do
        with_fx :wobble do
          with_fx :panslicer do
            with_fx :echo, phase: 1.6 do
              note, velocity = sync "/midi/akai_mpk25/0/1/note_on"
              synth :dtri, note: note, amp: velocity / 127.0
            end
          end
        end
      end
    end
  end
end