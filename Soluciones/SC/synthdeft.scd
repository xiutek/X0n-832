s.boot;
(
SynthDef.new(\xiu, {
	var sig, amp, env;
	env = EnvGen.kr(
	Env.new([0,1,0],[10,10],[1,-1]),
	doneAction:2);
	amp = SinOsc.kr({exprand(0.2,12)}!8).range(0,0.3);
	sig = SinOsc.ar({exprand(50,1200)}!8);
	sig = sig * amp * env;
	sig = Splay.ar(sig) * 0.5;
	Out.ar(0,sig);
}).add;
)

x = Synth.new(\xiu);

x.free;

{rrand(50, 1200)}!4;
