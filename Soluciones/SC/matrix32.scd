s.boot;

(
SynthDef(\bpfsaw, {
	arg atk=2, sus=0, rel=6, c1=1, c2=(-1), freq=500, detune=0.2, pan=0, cfhzmin=0.1, cfhzmax=0.3, cfmin=500, cfmax=2000, rqmin=0.1, rqmax=0.2, lsf=200, ldb=0, amp=1, out=0;
	var sig, env;
	env = EnvGen.kr(Env([0,1,1,0],[atk,sus,rel],[c1,0,c2]),doneAction:2);
	sig = Saw.ar(freq * {LFNoise1.kr(0.5,detune).midiratio}!2);
	sig = BPF.ar(
		sig,
		{LFNoise1.kr(
			LFNoise1.kr(4).exprange(cfhzmin,cfhzmax)
		).exprange(cfmin,cfmax)}!2,
		{LFNoise1.kr(0.1).exprange(rqmin,rqmax)}!2
	);
	sig = BLowShelf.ar(sig, lsf, 0.5, ldb);
	sig = Balance2.ar(sig[0], sig[1], pan);
	sig = sig * env * amp;
	Out.ar(out, sig);
}).add;
)

(
~marimbar = Pbind(
	\instrument, \bpfsaw,
	\dur, Pexprand(0.1,1,inf),
	\freq, Pexprand(0.25,9,inf),
	\detune, 0,
	\rqmin, 0.005,
	\rqmax, 0.008,
	\cfmin, 150,
	\cfmax, 1500,
	\amp, 2,
	\out, 0,
).play;
)

(
~marimba = Pbind(
	\instrument, \bpfsaw,
	\dur, Pexprand(0.1,1,inf),
	\freq, Pexprand(0.25,9,inf),
	\detune, 0,
	\rqmin, 0.005,
	\rqmax, 0.008,
	\cfmin, Pexprand(150,1500,inf),
	\cfmax, Pkey(\cfmin),
	\amp, 2,
	\out, 0,
).play;
)

(
~marimbamaj = Pbind(
	\instrument, \bpfsaw,
	\dur, Pexprand(0.1,1,inf),
	\freq, Pexprand(0.25,9,inf),
	\detune, 0,
	\rqmin, 0.005,
	\rqmax, 0.008,
	\cfmin, Prand((Scale.minor.degrees+64).midicps,inf) * Prand([0.5,1,2,4],inf),
	\cfmax, Pkey(\cfmin),
	\amp, 2,
	\out, 0,
).play;
)

(
~marimbamin = Pbind(
	\instrument, \bpfsaw,
	\dur, Pexprand(0.1,1,inf),
	\freq, Pexprand(0.25,9,inf),
	\detune, 0,
	\rqmin, 0.005,
	\rqmax, 0.008,
	\cfmin, Prand((Scale.minor.degrees+64).midicps,inf) * Prand([0.5,1,2,4],inf),
	\cfmax, Pkey(\cfmin),
	\amp, 2,
	\out, 0,
).play;
)


/*Progresión de Acordes:
(D16-F35-A06-C56),(D31-F30-A20-C51),
(A05-F59-C36-E27), (A10-F22-C45-G0)
*/

(
~chords = Pbind(
	\instrument, \bpfsaw,
	\dur, Pwhite(4.5,7.0,inf),
	\midinote, Pseq([
		[27,51,63,65,69],
		[24,48,60,66,70],
		[29,48,60,65,70],
		[24,48,60,66,69],

		[27,51,63,67,70],
		[24,48,60,68,70],
		[28,48,60,64,70],
		[24,48,60,66,69],

		[29,48,60,65,68],
		[24,48,60,67,69],
		[29,48,60,65,68],
		[22,46,68,65,68],

		[24,48,60,65,69],
		[19,55,60,67,69],
		[17,48,60,65,67],
		[14,47,59,62,67],
		[19,48,60,64,67],


	],inf),
	\detune, Pexprand(0.05,0.2,inf),
	\cfmin, 100,
	\cfmax, 1500,
	\rqmin, Pexprand(0.01,0.15,inf),
	\atk, Pwhite(2.0,2.5,inf),
	\rel, Pwhite(6.5,10.0,inf),
	\ldb, 6,
	\amp, 0.6,
	\out, 0,
).play;
)

~chords.play;
~chords.stop;
~marimba.play;
~marimba.stop;
~marimbar.play;
~marimbar.stop;
~marimbamaj.play;
~marimbamaj.stop;
~marimbamin.play;
~marimbamin.stop;




