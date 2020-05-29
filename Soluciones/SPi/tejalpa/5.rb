#PAGINA 6: THE UNIVERSE ATLAS,, GUITARRA MODIFICADA (RIFF NO 4)
# Guitar Strumming - by Emlyn
# This tries to work out the guitar (or ukulele etc.) fingering for arbitrary chords (and tuning).
# It seems to work reasonably well for basic chords, but is quite naive and probably makes many mistakes.
# Ideas, bug reports, fixes etc. gratefully received, just comment below, or tweet @emlyn77.
# Feel free to make use of this code as you like (with attribution if you feel like it, but you don't have to).
# Thanks to @Project_Hell_CK for fixing the tuning, and spotting that it gets chord(:f, :major) not quite right.
use_real_time
live_loop :otrulira do
  x1, x2, x3, bion = sync "/midi/akai_mpk25/0/sysex"
  if bion == 6
    
    # Next note higher or equal to base note n, that is in the chord c
    define :next_note do |n, c|
      # Make sure n is a number
      n = note(n)
      # Get distances to each note in chord, add smallest to base note
      n + (c.map {|x| (note(x) - n) % 12}).min
    end
    
    ukulele = [:cs, :b, :a, :g]
    guitar_standard = [:e4, :d4, :c3, :b4]
    
    # Return ring representing the chord chrd, as played on a guitar with given tuning
    define :guitar do |tonic, name, tuning=guitar_standard|
      chrd = (chord tonic, name)
      # For each string, get the next higher note that is in the chord
      c = tuning.map {|n| next_note(n, chrd)}.ring
      # We want the lowest note to be the root of the chord
      root = note(chrd[0])
      first_root = c.take_while {|n| (n - root) % 12 != 0}.count
      # Drop up to half the lowest strings to make that the case if possible
      if first_root > 0 and first_root < tuning.count / 2
        c = (ring :r) * first_root + c.drop(first_root)
      end
      # Display chord fingering
      #puts c.zip(tuning).map {|n, s| if n == :r then 'x' else (n - note(s)) end}.join, c
      c
    end
    
    # Strum a chord with a certain delay between strings
    define :strum do |c, d=0.1|
      in_thread do
        play_pattern_timed c.drop_while{|n| [nil,:r].include? n}, d
      end
    end
    
    use_debug false
    use_bpm 70
    
    live_loop :guit do
      #chords = ring((guitar :d, :m7), (guitar :g, '7'), (guitar :c, :M7), (guitar :f, :M7),
      #              (guitar :b, :m7), (guitar :e, '7'), (guitar :a, :m7))
      chords = ring((guitar :cs, :m), (guitar :b, :m), (guitar :a, :M), (ring :g, :g, 66, 64, 61, 60),
                    (guitar :cs, :m), (guitar :b, :m), (guitar :a, :M), (guitar :b, '7'))
      with_fx :reverb do
        with_fx :lpf, cutoff: 115 do
          with_fx :distortion, amp: 0.9 do
            with_synth :mod_saw do
              tick
              "D.DU.UDU".split(//).each do |s|
                if s == 'D' # Down stroke
                  strum chords.look, 0.05
                elsif s == 'U' # Up stroke
                  with_fx :level, amp: 0.5 do
                    strum chords.look.reverse, 0.03
                  end
                end
                sleep 0.5
              end
            end
          end
        end
      end
    end
  end
end