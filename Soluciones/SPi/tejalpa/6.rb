#PAGINA 4: THE UNIVERSE ATLAS, BOTONES DE EFECTOS

use_real_time
with_bpm 70 do
  live_loop :botonesfx do
    with_fx :level, amp: 1 do
      with_fx :reverb, amp: 1 do
        
        y1, y2, y3, bt = sync "/midi/akai_mpk25/0/sysex"
        if bt == 1
          samps = "C:/o/s/SWA"
        sample samps, "7" end
        if bt == 2
          samps = "C:/o/s/SWA"
        sample samps, "8" end
        if bt == 6
          samps = "C:/o/s/SWA"
        sample samps, "9" end
      end
    end
  end
end
