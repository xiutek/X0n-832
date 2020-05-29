// Name: Philip Cunningham
//
// To get everything up and running: execute the oscillator
// section, then the effects section and finally the
// GUI section.
//
// This code was adapted and extended from a discussion on
// the SC mailing list between Douglas Lamb and Nathaniel Virgo
//
// http://comments.gmane.org/gmane.comp.audio.supercollider.user/75545

// Don't forget to boot server
s.boot;

// Synth can be controlled by GUI or by MIDI keyboard
// You should select your MIDI interface below
MIDIClient.init;
// My MIDI keyboard was on channel 3
MIDIIn.connect(0,MIDIClient.sources[3]);

  /////////////////////////////////
 //     OSCILLATOR SECTION      //
/////////////////////////////////

(

  /////////////////////////////////
 //   BANDLIMITED SQUARE WAVE   //
/////////////////////////////////

SynthDef(\square,{arg midinote = 60, mod_ratio = 2, car_ratio = 1, a, s, r;
  var mod_index_k, car_source, mod_source, sig, out, limited, env, int;

  // Mod index in approx. linear on a log scale
  mod_index_k = 10**(midinote.linlin(40,90,2,1,nil));
  // Carrier multiplied by carrier ratio
  car_source = SinOsc.ar(midinote.midicps * car_ratio);
  // Modulator multiplied by the modulation ratio
  mod_source = SinOsc.ar(midinote.midicps * mod_ratio);
  // Take the exponent of mod index * mod source and subtract mod index
  sig = exp((mod_index_k * mod_source) - mod_index_k) * car_source;

  int = Integrator.ar(sig,0.99999); // Integrate the signal
  env = EnvGen.ar(  Env([0,0.5,0.5,0],[a, s, r]),  doneAction:2); // Add envelope
  out = int * env * 0.02; // Scale output
  limited = Limiter.ar(out, 0.8, 0.01); // Ensure doesn't clip

  Out.ar(0,limited);
}).add;

  /////////////////////////////////
 //  BANDLIMITED SAWTOOTH WAVE  //
/////////////////////////////////

SynthDef(\saw,{arg midinote = 60, mod_ratio = 1, car_ratio = 1, a, s, r;
  var mod_index_k, car_source, mod_source, sig, out, dc_block, limited, env, int;

  mod_index_k = 10**(midinote.linlin(40,90,2,1,nil));
  car_source = SinOsc.ar(midinote.midicps * car_ratio);
  mod_source = SinOsc.ar(midinote.midicps * mod_ratio);
  sig = exp((mod_index_k * mod_source) - mod_index_k) * car_source;

  int = Integrator.ar(sig,0.999);
  dc_block = LeakDC.ar(int,0.99); // DC blocking
  env = EnvGen.ar(  Env([0,1,1,0],[a, s, r]),  doneAction:2);
  out = dc_block * env * 0.008;
  limited = Limiter.ar(out, 0.8, 0.01);

  Out.ar(0,limited);
}).add;

  /////////////////////////////////
 //  BANDLIMITED TRIANGLE WAVE  //
/////////////////////////////////

SynthDef(\tri,{arg midinote = 60, mod_ratio = 2, car_ratio = 1, a, s, r;
  var mod_index_k, car_source, mod_source, sig, out, dc_block, limited, env, int;

  mod_index_k = 10**(midinote.linlin(40,90,2,1,nil));
  car_source = SinOsc.ar(midinote.midicps * car_ratio);
  mod_source = SinOsc.ar(midinote.midicps * mod_ratio);
  sig = exp((mod_index_k * mod_source) - mod_index_k) * car_source;
  int = Integrator.ar(Integrator.ar(sig,0.99),0.999); // Integrate twice
  dc_block = LeakDC.ar(int,0.9999);
  env = EnvGen.ar(  Env([0,1,1,0],[a, s, r]),  doneAction:2);
  out = dc_block * env * 0.001;
  limited = Limiter.ar(dc_block, 0.8, 0.01);

  Out.ar(0,out);
}).add;

  /////////////////////////////////
 //   ALTERED CAR/MOD RATIO 1   //
/////////////////////////////////

SynthDef(\modfm1,{arg midinote = 60, mod_ratio = 5, car_ratio = 1, a, s, r;
  var mod_index_k, car_source, mod_source, sig, out, limited, env, int;

  // Mod index in approx. linear on a log scale
  mod_index_k = 10**(midinote.linlin(40,90,2,1,nil));
  // Carrier multiplied by carrier ratio
  car_source = SinOsc.ar(midinote.midicps * car_ratio);
  // Modulator multiplied by the modulation ratio
  mod_source = SinOsc.ar(midinote.midicps * mod_ratio);
  // Take the exponent of mod index * mod source and subtract mod index
  sig = exp((mod_index_k * mod_source) - mod_index_k) * car_source;

  int = Integrator.ar(sig,0.99999); // Integrate the signal
  env = EnvGen.ar(  Env([0,0.5,0.5,0],[a, s, r]),  doneAction:2); // Add envelope
  out = int * env * 0.02; // Scale output
  limited = Limiter.ar(out, 0.8, 0.01); // Ensure doesn't clip

  Out.ar(0,limited);
}).add;

  /////////////////////////////////
 //   ALTERED CAR/MOD RATIO 2   //
/////////////////////////////////

SynthDef(\modfm2,{arg midinote = 60, mod_ratio = 3, car_ratio = 4, a, s, r;
  var mod_index_k, car_source, mod_source, sig, out, dc_block, limited, env, int;

  mod_index_k = 10**(midinote.linlin(40,90,2,1,nil));
  car_source = SinOsc.ar(midinote.midicps * car_ratio);
  mod_source = SinOsc.ar(midinote.midicps * mod_ratio);
  sig = exp((mod_index_k * mod_source) - mod_index_k) * car_source;

  int = Integrator.ar(sig,0.999);
  dc_block = LeakDC.ar(int,0.99); // DC blocking
  env = EnvGen.ar(  Env([0,1,1,0],[a, s, r]),  doneAction:2);
  out = dc_block * env * 0.008;
  limited = Limiter.ar(out, 0.8, 0.01);

  Out.ar(0,limited);
}).add;
)

  /////////////////////////////////
 //     EFFECTS SECTION         //
/////////////////////////////////

(

  /////////////////////////////////
 //       LOWPASS FILTER        //
/////////////////////////////////

SynthDef(\lowpass, {arg freq = 100, amount = 0, rate = 5;
  var input, effect, sine;

  sine = SinOsc.kr(rate,0,amount,1); // LFO

  input = In.ar(0,1);
  effect = LPF.ar(input, Lag.kr((sine)*freq, 0.2)); // Apply LFO and smooth

  ReplaceOut.ar(0,effect); // Replace output
}).add;

  /////////////////////////////////
 //       HIGHPASS FILTER       //
/////////////////////////////////

SynthDef(\hipass, {arg freq = 100, amount = 0, rate = 5;
  var input, effect, sine;

  sine = SinOsc.kr(rate,0,amount,1); // LFO

  input = In.ar(0,1); //get first channel on bus 0
  effect = HPF.ar(input, Lag.kr((sine)*freq, 0.2)); // Apply LFO and smooth

  ReplaceOut.ar(0,effect); // Replace output
}).add;

  /////////////////////////////////
 //           DELAY             //
/////////////////////////////////

SynthDef(\delay, {arg del = 0.001, dec = 0.01 ;
  var input, effect;

  input= In.ar(0,1); //get two channels of input starting (and ending) on bus 0

  // Add some smoothing to both the decay and delay time control
  effect = DelayN.ar(input, 1, Lag.kr(del, 2), Lag.kr(dec, 0.09)); // Max delay of one second

  Out.ar(0,effect); // Add to output
}).add;

  /////////////////////////////////
 //       FINAL LIMITER         //
/////////////////////////////////

SynthDef(\limiter, {arg gain;
  var input, effect;

  input = In.ar(0,1); //get first channel on bus 0
  // Note the exclamation mark followed by 2 makes
  // the the final output stereo
  effect = Limiter.ar((gain*input), 0.9, 0.01 ! 2); // Apply gain

  ReplaceOut.ar(0,effect); // Replace output
}).add;
)

  /////////////////////////////////
 //         GUI SECTION         //
/////////////////////////////////

(
// Select the oscillator
var osc, selected_osc, sound, array;
var lp, hp, de, li;
var envelope_array;
var knob_array;
var hpfreq, lpfreq, deltime, dectime, lforate, lpamount, hpamount, gaincontrol;

// Array of oscillator symbols
array = [\square, \saw, \tri, \modfm1, \modfm2];

// Make sure effects are added at the end
g = Group.basicNew(s,1);
lp = Synth.tail(g, \lowpass);
hp = Synth.tail(g, \hipass);
de = Synth.tail(g, \delay);
li = Synth.tail(g, \limiter);

// Initialise with square wave oscillator
selected_osc = array[0];

// Create window object
w = Window( "ModFM Synth", Rect( 200, 200, 740, 350 ));
w.view.decorator = FlowLayout( w.view.bounds ); // Keep things simple w/decorator

osc = ["Square","Saw","Triangle","ModFM1","ModFM2"]; // Array of three oscs' strings
v = ListView( w,Rect(10,10,100,100)); // Create list object

v.items = osc; // Add array to list
v.background_(Color.white); // Set list background colour

// Listen to the list
v.action = { arg list;
  // Set selected oscillator
  selected_osc = array[list.value];
};

// Envelope section
// Initialise envelope array
envelope_array = [0,0,0];

// Dynamically create three sliders (asr)
3.do({ arg i;
  l = GUI.slider.new( w, Rect( rrand( 20, 300 ), rrand( 20, 300 ), 30, 100 ));

  l.action = { arg slider;
    // Scale values
    envelope_array[i] = slider.value.linlin(0,1,0.001, 0.999);
x  };
});

// Filter cutoff and LFO section
// Initialise knob array
knob_array = [0,0,0,0,0,0,0,0];

// Dynamically create eight knobs
8.do({ arg i;
  l = GUI.knob.new( w, Rect( rrand( 20, 300 ), rrand( 20, 300 ), 60, 100 ));

  l.action = { arg knob;
    knob_array[i] = knob.value;

    // Store array values into variables
    // Values are scaled using linlin
    lpfreq = knob_array[0].linlin(0,1,200,10000);
    hpfreq = knob_array[1].linlin(0,1,200,1000);
    deltime = knob_array[2].linlin(0,1,0.0001,0.999);
    dectime = knob_array[3].linlin(0,1,0.01,0.999);
    lforate = knob_array[4].linlin(0,1,0.01,15);
    lpamount = knob_array[5].linlin(0,1,0.01,0.999);
    hpamount = knob_array[6].linlin(0,1,0.01,0.999);
    gaincontrol = knob_array[7].linlin(0,1,1.01,3);

    // Send parameters to effects
    lp.set(\freq, lpfreq, \rate, lforate, \amount, lpamount); // Low pass filter
    hp.set(\freq, hpfreq, \rate, lforate, \amount, hpamount); // High pass filter
    de.set(\del, deltime, \dec, dectime ); // Delay
    li.set(\gain, gaincontrol); // Limiter
  };
});

// Create labels for oscillators, envelope and knobs
JSCStaticText( w, Rect( 20, 20, 95, 50 )).string_( "Select OSC" ).align_( \center );
JSCStaticText( w, Rect( 20, 20, 101, 50 )).string_( "Envelope (ASR)" ).align_( \center );
JSCStaticText( w, Rect( 20, 20, 60, 50 )).string_( "LP freq" ).align_( \center );
JSCStaticText( w, Rect( 20, 20, 60, 50 )).string_( "HP freq" ).align_( \center );
JSCStaticText( w, Rect( 20, 20, 60, 50 )).string_( "Del time" ).align_( \center );
JSCStaticText( w, Rect( 20, 20, 60, 50 )).string_( "Dec vol" ).align_( \center );
JSCStaticText( w, Rect( 20, 20, 60, 50 )).string_( "LFO rate" ).align_( \center );
JSCStaticText( w, Rect( 20, 20, 60, 50 )).string_( "LP %" ).align_( \center );
JSCStaticText( w, Rect( 20, 20, 60, 50 )).string_( "HP %" ).align_( \center );
JSCStaticText( w, Rect( 20, 20, 60, 50 )).string_( "Gain" ).align_( \center );

// Add GUI midi keyboard object
// Source: http://www.ixi-audio.net/content/body_backyard_sc.html
// Author: Thor Magnusson
k = MIDIKeyboard.new(w, Rect(20, 20, 730, 160), 4, 40);

// Send midi notes and envelope information to appropriate oscillator
k.keyDownAction_({arg note;
  Synth.head(g, selected_osc, [\midinote, note, \a, envelope_array[0], \s, envelope_array[1], \r, envelope_array[2]]);
});

// Send midi notes and envelope information to appropriate oscillator (this handles glissando)
k.keyTrackAction_({arg note;
  Synth.head(g,selected_osc, [\midinote, note, \a, envelope_array[0], \s, envelope_array[1], \r, envelope_array[2]]);
});

// Allow synth control from MIDI keys
MIDIIn.noteOn= { arg src, chan, num, vel;
  Synth.head(g, selected_osc, [\midinote, num, \a, envelope_array[0], \s, envelope_array[1], \r, envelope_array[2]]);
};

// Bring window to front
w.front;

// Kill synths on close
w.onClose = {s.quit;};
)
