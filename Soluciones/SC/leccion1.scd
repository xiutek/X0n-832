/*bootear el server*/
Server.local.boot;^

/*Variable x es = a SinOSc + argumentos*/
x = {SinOsc.ar(440, SinOsc.ar(XLine.kr(420, 500, 9), 0, 2pi), 0.25)};
y = x.play;
y.free;

/*Esta es una mejor forma de escribir los argumentos*/
(
z = {
	arg freq = 440, amp = 0.25;
	var sig;
	sig = SinOsc.ar(freq) * amp;
}.play;
)
z.set (\freq, 330);
z.set (\amp, 0.1);
z.set (\freq, 660, \amp, 0.125);
z.free;

/*uGen controlando otra uGen, (kr=control)*/
(
z = {
	arg noiseHz=8;
	var freq, amp, sig;
	freq = LFNoise0.kr(noiseHz).exprange(100,300);
	amp = LFNoise1.kr(12).exprange(0.02,0.8);
	sig = SinOsc.ar(freq) *amp;
}.play;
)
z.set(\noiseHz, 12);
z.free