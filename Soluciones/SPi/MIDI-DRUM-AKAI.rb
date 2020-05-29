#DRUM FOR "THE UNIVERSE ATLAS" BY MZRAIM & WTF!

#NO LE HAGAS CASO A ESTO, REVISA DONDE DICE MIZRA
#MIDI Pads
live_loop :pads do
  pada, padb = sync "/midi/akai_mpk25/0/16/note_on"
  #PADS 10-12 *DRUM SAMPLES*
  if pada == 52
    samps = "C:/o/s/rdrum", 0
  sample samps, 2, amp: padb end
  if pada == 50
    samps = "C:/o/s/rdrum"
  sample samps, 1, amp: padb end
  if pada == 48
    samps = "C:/o/s/rdrum/100-drugs.wav"
  sample samps, amp: padb end
  #PADS 4-9 *BEATS SAMPLES*
  if pada == 59
    samps = "C:/o/s/sgen"
  sample samps, "Perc - 11", amp: padb end
  if pada == 57
    samps = "C:/o/s/sgen"
  sample samps, "snare 19",  amp: padb end
  if pada == 55
    samps = "C:/o/s/sgen"
  sample samps, 1, amp: padb end
  if pada == 65
    samps = "C:/o/s/sgen"
  sample samps, "kick", amp: padb end
  if pada == 64
    samps = "C:/o/s/sgen"
  sample samps, "Cymbal", amp: padb end
  if pada == 62
    samps = "C:/o/s/sgen"
  sample samps, 23, amp: padb end
  #PADS 1-3 *ARPS AND MELODYS*
  #MIZRA
  if pada == 72
    samps = "C:/o/s/rdrum", 0
  sample samps, 2, amp: padb end
  if pada == 71
    samps = "C:/o/s/rdrum"
  sample samps, 1, amp: padb end
  if pada == 69
    samps = "C:/o/s/rdrum/100-drugs.wav"
  sample samps, amp: padb end
  use_real_time
end