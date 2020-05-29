#PAGINA 4: THE UNIVERSE ATLAS, PADS DE AKAI MPK25

#AKAI MPK25 DEBE ESTAR EN FL STUDIO (6), BANK PAD A   MIDI CHANEL 16A, PAD BANK DEFAULT
#MIDI Pads

use_real_time
with_bpm 70 do
  live_loop :pads do
    with_fx :level, amp: 0.666 do
      with_fx :reverb, amp: 0.3 do
        with_bpm 70 do
          pada, padb = sync "/midi/akai_mpk25/0/16/note_on"
          #PADS 10-12 *DRUM SAMPLES*
          if pada == 52
            samps = "C:/o/s/atlas"
          sample samps, "intro", amp: padb end
          if pada == 50
            samps = "C:/o/s/atlas"
          sample samps, "main", amp: padb end
          if pada == 48
            samps = "C:/o/s/atlas"
          sample samps, "outro", amp: padb end
          #PADS 4-9 *BEATS SAMPLES*
          if pada == 59
            samps = "C:/o/s/atlas"
          sample samps, "piano", amp: padb end
          if pada == 57
            samps = "C:/o/s/atlas"
          sample samps, "voice",  amp: padb end
          if pada == 55
            samps = "C:/o/s/atlas"
          sample samps, "sea", amp: padb end
          if pada == 65
            samps = "C:/o/s/atlas"
          sample samps, "3", amp: padb end
          if pada == 64
            samps = "C:/o/s/atlas"
          sample samps, "2", amp: padb end
          if pada == 62
            samps = "C:/o/s/atlas"
          sample samps, "1", amp: padb end
          #PADS 1-3 *ARPS AND MELODYS*
          #MIZRA
          if pada == 72
            samps = "C:/o/s/atlas"
          sample samps, "dub", amp: padb end
          if pada == 71
            samps = "C:/o/s/atlas"
          sample samps, "brake", amp: padb end
          if pada == 69
            samps = "C:/o/s/atlas"
          sample samps, "4", amp: padb end
        end
      end
    end
  end
end