---
title: 'MUMT 616: Inharmonicity'
type: book
math: true
---

Inharmonicity in the context of plucked strings.

<!--more-->

## Abstract

During the course [MUMT 616: Timbre as a Form-Bearing Dimension in Music](https://www.mcgill.ca/study/2018-2019/courses/mumt-616), I talked about inharmonicity in the context of plucked strings.

The slides are available {{% staticref "media/mumt616/inharmonicity_presentation.pdf" %}}here{{% /staticref %}}.

Five examples with varying degrees of inharmonicity are discussed. The examples are qualitatively classified as:

- [No inharmonicity](#no-inharmonicity)
- [Low inharmonicity](#low-inharmonicity)
- [Mid inharmonicity](#mid-inharmonicity)
- [High inharmonicity](#high-inharmonicity)
- [Extreme inharmonicity](#extreme-inharmonicity)

The musical examples were generated from [Manuel María Ponce's Valse for Solo Guitar](https://imslp.org/wiki/4_Pieces_for_Guitar_(Ponce%2C_Manuel)).

The inharmonicity was computed for each partial using the following formula:

$$ f_n = nf_0 \sqrt{1 + Bn^2} $$

where $f_n$ is the frequency of a given partial, and the $B$ parameter controls the inharmonicity.

The [SuperCollider programming language](https://supercollider.github.io/) was used to generate the audio examples with varying inharmonicity.

The code is [listed here](#supercollider-code-for-generating-the-audio-samples) for reference.

## Examples

### No inharmonicity

{{< figure library="1" src="mumt616/noinh.png" title="No inharmonicity" numbered="true" >}}
{{< audio src="/media/mumt616/noinh.mp3" type="audio/wav" >}}

### Low inharmonicity

{{< figure library="1" src="mumt616/lowinh.png" title="Low inharmonicity" numbered="true" >}}
{{< audio src="/media/mumt616/lowinh.mp3" type="audio/wav" >}}

### Mid inharmonicity

{{< figure library="1" src="mumt616/midinh.png" title="Mid inharmonicity" numbered="true" >}}
{{< audio src="/media/mumt616/midinh.mp3" type="audio/wav" >}}

### High inharmonicity

{{< figure library="1" src="mumt616/highinh.png" title="High inharmonicity" numbered="true" >}}
{{< audio src="/media/mumt616/highinh.mp3" type="audio/wav" >}}

### Extreme inharmonicity

{{< figure library="1" src="mumt616/crazyinh.png" title="Extreme inharmonicity" numbered="true" >}}
{{< audio src="/media/mumt616/crazyinh.mp3" type="audio/wav" >}}

## SuperCollider code for generating the audio samples

```supercollider
(
SynthDef(\inh, { |out=0, freq=440, amp=0.5, gate=1, c3=20, pan=0,fB = 180|
    var env = Env.new([0,1, 1, 0],[0.001,0.006, 0.0005],[5,-5, -8]);
    var inp = amp * LFClipNoise.ar(2000) * EnvGen.ar(env,gate);
	var son = DWGPluckedStiff.ar(freq, amp, gate,0.1,1,c3,inp,1,MouseX.kr(0,200));
    DetectSilence.ar(son, 0.001, doneAction:2);
    Out.ar(out, Pan2.ar(son * 0.1, pan));
}).add;
)

(
SynthDef(\har, { |out=0, freq=440, amp=0.5, gate=1, c3=20, pan=0|
    var env = Env.new([0,1, 1, 0],[0.001,0.006, 0.0005],[5,-5, -8]);
    var inp = amp * LFClipNoise.ar(2000) * EnvGen.ar(env,gate);
    var son = DWGPlucked.ar(freq, amp, gate,0.1,1,c3,inp,1);
    DetectSilence.ar(son, 0.001, doneAction:2);
    Out.ar(out, Pan2.ar(son * 0.1, pan));
}).add;
)


(
SynthDef(\noinh,
	{
		|out=0, freq=440, amp=0.4, fB=0| //partials = 4
		// Number of partials cannot change dynamically in the SynthDef :(
		var sig, env, partials = 16;
		// Need an envelope, otherwise the sinewaves play forever
		env = Env.linen(0.03, 0.5, 0.15, amp);
		// Summing the sinewaves
		sig = Mix.fill(partials,
			{
				arg i;
				// Need a 1-based-index for the partials
				var n = i+1, harmonic, partial, ampdecay;
				harmonic = n*freq;
				partial = harmonic * sqrt(1 + (fB* n**2));
				ampdecay = 1/n;
				SinOsc.ar(partial, 0, ampdecay * EnvGen.kr(env,doneAction:2));
			}
		);
		Out.ar(out, Pan2.ar(sig));
}).add;
)

(
SynthDef(\sineSynth,
	{
		|out=0, freq=440, amp=0.4|
		var sig;
		sig = SinOsc.ar(freq, 0, amp);
		Out.ar(out, Pan2.ar(sig));
}).add;
)




(
SynthDef(\lowinh,
	{
		|out=0, freq=440, amp=0.4, fB=0.005| //partials = 4
		// Number of partials cannot change dynamically in the SynthDef :(
		var sig, env, partials = 20;
		// Need an envelope, otherwise the sinewaves play forever
		env = Env.linen(0.03, 0.4, 0.15, amp);
		// Summing the sinewaves
		sig = Mix.fill(partials,
			{
				arg i;
				// Need a 1-based-index for the partials
				var n = i+1, harmonic, partial, ampdecay;
				harmonic = n*freq;
				partial = harmonic * sqrt(1 + (fB* n**2));
				ampdecay = 1/n;
				SinOsc.ar(partial, 0, ampdecay * EnvGen.kr(env,doneAction:2));
			}
		);
		Out.ar(out, Pan2.ar(sig));
}).add;
)

(
SynthDef(\midinh,
	{
		|out=0, freq=440, amp=0.4, fB=0.015| //partials = 4
		// Number of partials cannot change dynamically in the SynthDef :(
		var sig, env, partials = 20;
		// Need an envelope, otherwise the sinewaves play forever
		env = Env.linen(0.03, 0.4, 0.15, amp);
		// Summing the sinewaves
		sig = Mix.fill(partials,
			{
				arg i;
				// Need a 1-based-index for the partials
				var n = i+1, harmonic, partial, ampdecay;
				harmonic = n*freq;
				partial = harmonic * sqrt(1 + (fB* n**2));
				ampdecay = 1/n;
				SinOsc.ar(partial, 0, ampdecay * EnvGen.kr(env,doneAction:2));
			}
		);
		Out.ar(out, Pan2.ar(sig));
}).add;
)

(
SynthDef(\highinh,
	{
		|out=0, freq=440, amp=0.4, fB=0.0874| //partials = 4
		// Number of partials cannot change dynamically in the SynthDef :(
		var sig, env, partials = 20;
		// Need an envelope, otherwise the sinewaves play forever
		env = Env.linen(0.03, 0.4, 0.15, amp);
		// Summing the sinewaves
		sig = Mix.fill(partials,
			{
				arg i;
				// Need a 1-based-index for the partials
				var n = i+1, harmonic, partial, ampdecay;
				harmonic = n*freq;
				partial = harmonic * sqrt(1 + (fB* n**2));
				ampdecay = 1/n;
				SinOsc.ar(partial, 0, ampdecay * EnvGen.kr(env,doneAction:2));
			}
		);
		Out.ar(out, Pan2.ar(sig));
}).add;
)

(
SynthDef(\crazyinh,
	{
		|out=0, freq=440, amp=0.4, fB=1| //partials = 4
		// Number of partials cannot change dynamically in the SynthDef :(
		var sig, env, partials = 20;
		// Need an envelope, otherwise the sinewaves play forever
		env = Env.linen(0.03, 0.4, 0.15, amp);
		// Summing the sinewaves
		sig = Mix.fill(partials,
			{
				arg i;
				// Need a 1-based-index for the partials
				var n = i+1, harmonic, partial, ampdecay;
				harmonic = n*freq;
				partial = harmonic * sqrt(1 + (fB* n**2));
				ampdecay = 1/n;
				SinOsc.ar(partial, 0, ampdecay * EnvGen.kr(env,doneAction:2));
			}
		);
		Out.ar(out, Pan2.ar(sig));
}).add;
)

(
m = SimpleMIDIFile.read("/Stimulus 1 major.mid");
m.p(\noinh).play;
)

(
m = SimpleMIDIFile.read("/op28n20.mid");
m.p(\lowinh).play;
)

(
m = SimpleMIDIFile.read("/op28n20.mid");
m.p(\lowinh).play;
)

(
m = SimpleMIDIFile.read("/op28n20.mid");
m.p(\lowinh).play;
)

(
Routine.run {
	var s, m, synth, release;
	s = Server.default;
	s.sync;
    s.record(path: "~/out.wav".standardizePath);

	release = 0.3;
	m = SimpleMIDIFile.read("/Stimulus 1 major.mid");
	m.p(\lowinh).play;
	3.wait;

	// Wait for the Synth to release before stopping the recording.
	release.wait;
	s.stopRecording;
    };
)
s.stopRecording;

(
    Routine.run {
        var s, synth, release;
        s = Server.default;

        s.sync;

        s.record(path: "~/out.wav".standardizePath);

        release = 0.3;
        synth = Synth(\noinh, [freq: 30.midicps]);
        2.wait;
        synth.set(0);

        // Wait for the Synth to release before stopping the recording.
        release.wait;
        s.stopRecording;
    };
)


(
x = Synth(\sineSynth);
f = {
	arg m;
	x.set("freq", m.midicps);
	m.postln;
};
m = SimpleMIDIFile.read("/Stimulus 1 major.mid");
//x = Synth(\sineSynth);
m.playNotesWithFunction(f)
)
```
