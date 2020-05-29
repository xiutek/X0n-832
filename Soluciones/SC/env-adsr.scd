(x=
{
	arg gate=0;
	var sig, env, freq;
	freq = EnvGen.kr(Env.adsr(1), gate, 200, 0.1);
	env = EnvGen.kr(Env.adsr, gate, doneAction:2);
	sig = VarSaw.ar(SinOsc.kr(16).range(500,1000))*env;
}.play;
)
x.set(\gate, 1);