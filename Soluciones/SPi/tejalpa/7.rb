#PAGINA 4: THE UNIVERSE ATLAS, PADS DE AKAI MPK25

#AKAI MPK25 DEBE ESTAR EN FL STUDIO (6), BANK PAD A   MIDI CHANEL 16A, PAD BANK DEFAULT
#MIDI Pads

use_real_time
with_bpm 50 do
  live_loop :padsb do
    with_fx :level, amp: 0.666 do
      with_fx :reverb, amp: 0.3 do
        with_fx :wobble do
          with_fx :echo do
            with_bpm 70 do
              pada, padb = sync "/midi/akai_mpk25/0/16/note_on"
              #PADS 10-12 *DRUM SAMPLES*
              if pada == 52
                samps = "C:/o/s/vocal"
              sample samps, "shout", 1, amp: padb end
              if pada == 50
                samps = "C:/o/s/vocal"
              sample samps, "shout", 2, amp: padb end
              if pada == 48
                samps = "C:/o/s/fx"
              sample samps, 2, amp: padb end
              #PADS 4-9 *BEATS SAMPLES*
              if pada == 59
                samps = "C:/o/s/sgen"
              sample samps, 54, amp: padb end
              if pada == 57
                samps = "C:/o/s/sgen"
              sample samps, "enmkick2",  amp: padb end
              if pada == 55
                samps = "C:/o/s/sgen"
              sample samps, 76, amp: padb end
              if pada == 65
                samps = "C:/o/s/sgen"
              sample samps, 64, amp: padb end
              if pada == 64
                samps = "C:/o/s/sgen"
              sample samps, 148, amp: padb end
              if pada == 62
                samps = "C:/o/s/sgen"
              sample samps, 77, amp: padb end
              #PADS 1-3 *ARPS AND MELODYS*
              #MIZRA
              if pada == 72
                samps = "C:/o/s/sgen"
              sample samps, 58,  amp: padb end
              if pada == 71
                samps = "C:/o/s/sgen"
              sample samps, 57,  amp: padb end
              if pada == 69
                samps = "C:/o/s/rdrum"
              sample samps, 3, amp: padb end
            end
          end
        end
      end
    end
  end
end
