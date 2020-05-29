(
{
	var sig, env;
	env = EnvGen.kr(Env.new(
		[0, 0.6, 0.2, 0],
		[0.5, 0.6, 2],
		[3, -3, 0]),
		doneAction:2);
	sig = Pulse.ar(ExpRand(30,500))*env;
}.play;
)

Env.new([0, 0.6, 0.2, 0], [0.5, 0.6, 2], [3, -3, 0]).plot;