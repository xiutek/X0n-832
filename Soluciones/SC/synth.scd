x = {VarSaw.ar(40!2, 0, 0.05)}.play;
x.free

(
	SynthDef.new(\do, {
		arg freq=40;
		var temp, sum, env;
		sum = 0;
		env = EnvGen.kr(
			Env.perc(0.01, 3, 1, -2),
			doneAction:2
		);
		10.do{
			temp = VarSaw.ar(
				freq * {Rand(0.99,1.02)}!2,
				{Rand(0.0, 1.0)}!2,
				{ExpRand(0.005, 0.05)}!2
			);
			sum = sum + temp;
		};
		sum = sum * 0.05 * env;
		Out.ar(0, sum);
	}).add;
    SynthDef.new(\ro, {
		arg freq=400;
		var temp, sum, env;
		sum = 0;
		env = EnvGen.kr(
			Env.perc(0.01, 3, 1, -2),
			doneAction:2
		);
		10.do{
			temp = VarSaw.ar(
				freq * {Rand(0.99,1.02)}!2,
				{Rand(0.0, 1.0)}!2,
				{ExpRand(0.005, 0.05)}!2
			);
			sum = sum + temp;
		};
		sum = sum * 0.05 * env;
		Out.ar(0, sum);
	}).add;
)

x = Synth.new(\do, [\freq, 400]);
y = Synth.new(\ro, [\freq, 300]);
z = Synth.new(\do, [\freq, 200]);
n = Synth.new(\do, [\freq, 100]);
m = Synth.new(\do, [\freq, 600]);

x;