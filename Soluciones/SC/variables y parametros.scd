// Un generador de tono con argumentos modificables

x = {SinOsc.ar(436, 0, 0.3, 0.3)}.play

x.free;

(
z = {
	arg freq=336, amp=1;
	var sig;
	sig = SinOsc.ar(freq) * amp;
}.play;
)

z.set(\freq, 300);
z.set(\amp, 0.333);
z.set(\freq, 355);

// un generador de ruido aleatorio

(
y = {
	arg noiseHz=8;
	var freq, amp, sig;
	freq = LFNoise0.kr(noiseHz).exprange(1000, 300);
	amp = LFNoise1.kr(12).exprange(0.02, 1);
	sig  = SinOsc.ar(freq)* amp;
}.play;
)

// modificar parametros en vivo con arg y set

y.set(\noiseHz, 10);
y.set(\noiseHz, exprand(100,100));
y.free;