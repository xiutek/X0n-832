(
y = {
	arg noiseHz=8;
	var freq, amp, sig;
	freq = LFNoise0.kr(noiseHz).exprange(1000, 300);
	amp = LFNoise1.kr(12).exprange(0.02, 1);
	sig  = SinOsc.ar(freq)* amp;
}.play;
)

(
SynthDef.new(\cablo, {
	arg noiseHz=8;
	var freq, amp, sig;
	freq = LFNoise0.kr(noiseHz).exprange(1000, 300);
	amp = LFNoise1.kr(12).exprange(0.02, 1);
	sig  = SinOsc.ar(freq)* amp;
	Out.ar(0, sig);
}).add;
)

x = Synth.new(\cablo);
x.free

// ejemplo poco mas complejo de variable y argumentos sobre generador de ruido aleatorio y funcion round

(
SynthDef.new(\pulseTest, {
	arg ampHz=4, fund=40, maxPartial=4, width=0.5;
	var amp1, amp2, freq1, freq2, sig1, sig2;
	amp1 = LFPulse.kr(ampHz, 0, 0.12) * 0.75;
	amp2 = LFPulse.kr(ampHz, 0.5, 0.12) * 0.75;
	freq1 = LFNoise0.kr(4).exprange(fund, fund*maxPartial).round(fund);
	freq2 = LFNoise0.kr(4).exprange(fund, fund*maxPartial).round(fund);
	freq1 = freq1 * LFPulse.kr(8, add:1);
	freq2 = freq2 * LFPulse.kr(6, add:1);
	sig1 = Pulse.ar(freq1, width, amp1);
	sig2 = Pulse.ar(freq2, width, amp2);
	sig1 = FreeVerb.ar(sig1, 0.7, 0.8, 0.25);
	sig2 = FreeVerb.ar(sig2, 0.7, 0.8, 0.25);
	Out.ar(-1, sig1);
	Out.ar(1, sig2);
}).add;
)

x = Synth.new(\pulseTest);

x.set(\width, 0.25);
x.set(\fund, 50);
x.set(\maxPartial, 1);
x.set(\ampHz, 0.25);

// iniciar con estos parametros

x = Synth.new(\xxx,[\ampHz, 0.25, \fund, 50, \maxPartial, 1, \width, 0.25]);
x = Synth.new(\xxx,[\ampHz, 0.5, \fund, 25, \maxPartial, 2, \width, 0.5]);
x = Synth.new(\xxx,[\ampHz, 10, \fund, 75, \maxPartial, 0.333, \width, 0.3]);
x = Synth.new(\xxx,[\ampHz, 1, \fund, 100, \maxPartial, 0.333, \width, 0.125]);
x = Synth.new(\xxx,[\ampHz, 0.33, \fund, 200, \maxPartial, 0.666, \width, 0.125]);
x = Synth.new(\xxx,[\ampHz, 2, \fund, 400, \maxPartial, 1.6, \width, 0.125]);




x.free
y.free