(
var midi, dur;
midi = Pseq([40, 40, 47, 69, 60, 60, 63, 69, 60, 60, 63, 69, 60, 60, 63, 69, ], 1).asStream;
dur = Pseq([0.3, 0.3, 0.3, 0.3, 0.3, 0.3, 0.3, 0.3, 0.3, 0.3, 0.3, 0.3, 0.3, 0.3, 0.3, 0.3, ], 1).asStream;

SynthDef(\smooth, { |out, freq = 432, sustain = 1, amp = 0.5|
    var sig;
    sig = SinOsc.ar(freq, SinOsc.ar(XLine.kr(1000, 1000, 9000), 100, 90pi), 0.25) * EnvGen.kr(Env.linen(0.02, sustain, 0.1), doneAction: Done.freeSelf);
    Out.ar(out, sig ! 2)
}).add;

r = Task({
    var delta;
    while {
        delta = dur.next;
        delta.notNil
    } {
        Synth(\smooth, [freq: midi.next.midicps, sustain: delta]);
        delta.yield;
    }
}).play(quant: TempoClock.default.beats + 1.0);
)

(
var midi, dur;
midi = Pseq([29, 29, 32, 32, 29, 29, 32, 32, 29, 29, 32, 32, 29, 29, 32, 32, ], 1).asStream;
dur = Pseq([2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, ], 1).asStream;

SynthDef(\smooth, { |out, freq = 432, sustain = 0, amp = 0.5|
    var sig;
	sig = SinOsc.ar(freq, SinOsc.ar(XLine.kr(freq, 1, 3), 5, 9pi), 0.8) * EnvGen.kr(Env.linen(0.02, sustain, 0.1), doneAction: Done.freeSelf);
    Out.ar(out, sig ! 2)
}).add;

r = Task({
    var delta;
    while {
        delta = dur.next;
        delta.notNil
    } {
        Synth(\smooth, [freq: midi.next.midicps, sustain: delta]);
        delta.yield;
    }
}).play(quant: TempoClock.default.beats + 1.0);
)

(
{
({RHPF.ar(OnePole.ar(BrownNoise.ar, 0.99), LPF.ar(BrownNoise.ar, 14)
* 400 + 500, 0.03, 0.003)}!2)
+ ({RHPF.ar(OnePole.ar(BrownNoise.ar, 0.99), LPF.ar(BrownNoise.ar, 20)
* 800 + 1000, 0.03, 0.03)}!2)
* 4
}.play
)

(
play{SinOsc.ar(OnePole.ar(Mix(
LFSaw.ar([1,4],[0,0.3],800000,800000).trunc([20000000,100000000])*[1,-1]
),0.98)).dup*0.1}
)