---
title: Voice leading in repeating harmonies
subtitle: Does J.S. Bach change the position of a chord when repeating the same harmony?
summary: "A brief experiment on 69 chorales to determine whether a voice-leading algorithm should 
change the voicing when harmonies denoted by the same roman numeral appear contiguously."
authors:
- admin
tags: []
categories: []
date: "2020-11-19T00:00:00Z"
lastMod: "2020-11-19T00:00:00Z"
featured: false
draft: false

# Featured image
# To use, add an image named `featured.jpg/png` to your page's folder. 
# image:
#   caption: ""
#   focal_point: "" -->

# Projects (optional).
#   Associate this post with one or more of your projects.
#   Simply enter your project's folder or file name without extension.
#   E.g. `projects = ["internal-project"]` references 
#   `content/project/deep-learning/index.md`.
#   Otherwise, set `projects = []`.
projects: []
---

It is common to find progressions where the same roman numeral repeats itself:

![image](https://user-images.githubusercontent.com/7258463/99705663-05f77180-2a68-11eb-9008-f84494a1e3ed.png)

I think in these cases, a common procedure for *good* voice leading is to prefer a change of the voicing (e.g., change of position in the three upper voices), penalizing the algorithm for proposing the exact same voicing twice.

I wanted to make sure that the policy coincides with the practice in existing music.

I looked for repeated harmonies like these in 69 annotated Bach Chorales and found **192 instances**.

The analyzed Bach chorales are located in the [KernScores](http://kern.ccarh.org/) website.

They can be visualized interactively in the [Verovio Humdrum Viewer](https://verovio.humdrum.org/).

They can also be scraped with a single query to the Kern Scores server: https://kern.humdrum.org/data?l=BachChoralesAnalyzed

I used the last approach to collect the data for this experiment. The code can found in this [Jupyter Notebook](https://github.com/napulen/jupyter_notebooks/blob/master/repeatedharmonies/repeatedharmonies.ipynb).	

Out of the 192 instances found:
- In 78% of them, the voicing **changes**
- In 22% of them, the voicing **remains the same**

Here are a few of the instances I found. Red means different voicing and green means same voicing.

![image](https://user-images.githubusercontent.com/7258463/99707873-0d6c4a00-2a6b-11eb-9dc5-e42eaaabe324.png)

For completeness, here is the full table. Offsets are given in quarter notes from the beginning of the score (starting from `0.0`). In all instances, `chord1` and `chord2` are contiguous and annotated by a human expert:
| file        | chord1_offset | chord1_notes                 | chord2_offset | chord2_notes                 | same_voicing? | 
|-------------|---------------|------------------------------|---------------|------------------------------|---------------| 
| chor315.krn |               |                              |               |                              |               | 
|             | 5.0           | ['B4', 'G4', 'D4', 'G2']     | 8.0           | ['B4', 'G4', 'D4', 'G2']     | True          | 
| chor001.krn |               |                              |               |                              |               | 
|             | 0.0           | ['G4', 'D4', 'B3', 'G2']     | 1.0           | ['G4', 'D4', 'B3', 'G3']     | False         | 
|             | 19.0          | ['G4', 'D4', 'B3', 'G2']     | 21.0          | ['B4', 'G4', 'D4', 'G2']     | False         | 
|             | 21.0          | ['B4', 'G4', 'D4', 'G2']     | 22.0          | ['B4', 'G4', 'D4', 'G2']     | True          | 
|             | 24.0          | ['D5', 'G4', 'B3', 'B2']     | 25.0          | ['D5', 'G4', 'B3', 'B2']     | True          | 
|             | 30.0          | ['G4', 'E4', 'B3', 'E3']     | 31.0          | ['B4', 'E4', 'G3', 'E3']     | False         | 
| chor024.krn |               |                              |               |                              |               | 
|             | 0.0           | ['D4', 'A3', 'F#3', 'D3']    | 1.0           | ['A4', 'D4', 'F#3', 'D3']    | False         | 
|             | 6.0           | ['D5', 'F#4', 'A3', 'D3']    | 7.0           | ['D5', 'F#4', 'A3', 'D2']    | False         | 
|             | 7.0           | ['D5', 'F#4', 'A3', 'D2']    | 8.0           | ['F#5', 'A4', 'A4', 'D4']    | False         | 
|             | 13.0          | ['D5', 'A4', 'F#4', 'D3']    | 16.0          | ['D5', 'A4', 'F#4', 'D3']    | True          | 
|             | 16.0          | ['D5', 'A4', 'F#4', 'D3']    | 17.0          | ['F#5', 'D5', 'A4', 'D4']    | False         | 
| chor050.krn |               |                              |               |                              |               | 
|             | 7.0           | ['A4', 'F4', 'C4', 'F3']     | 8.0           | ['A4', 'F4', 'C4', 'F3']     | True          | 
|             | 9.0           | ['C5', 'F4', 'C4', 'A3']     | 10.0          | ['C5', 'F4', 'C4', 'A2']     | False         | 
|             | 33.0          | ['C5', 'F4', 'C4', 'A3']     | 34.0          | ['C5', 'F4', 'C4', 'A3']     | True          | 
| chor323.krn |               |                              |               |                              |               | 
|             | 31.0          | ['A4', 'F4', 'C4', 'F2']     | 33.0          | ['A4', 'F4', 'C4', 'F2']     | True          | 
| chor176.krn |               |                              |               |                              |               | 
|             | 0.0           | ['F4', 'C4', 'A3', 'F2']     | 1.0           | ['F4', 'C4', 'A3', 'F3']     | False         | 
|             | 16.0          | ['C5', 'G4', 'C4', 'E3']     | 17.0          | ['C5', 'E3', 'G4', 'E4']     | False         | 
|             | 19.0          | ['A4', 'G4', 'D4', 'D3']     | 20.0          | ['A4', 'D3', 'F4', 'A3']     | False         | 
|             | 25.0          | ['C5', 'E4', 'A3', 'A3']     | 26.0          | ['C5', 'E4', 'C4', 'A3']     | False         | 
|             | 34.0          | ['F4', 'A3', 'F3', 'D3']     | 36.0          | ['F4', 'D4', 'A3', 'D3']     | False         | 
| chor200.krn |               |                              |               |                              |               | 
|             | 12.0          | ['G4', 'D4', 'B-3', 'G2']    | 14.0          | ['G4', 'D4', 'B-3', 'G3']    | False         | 
|             | 28.0          | ['C5', 'A4', 'F4', 'F3']     | 29.0          | ['C5', 'A4', 'F4', 'F3']     | True          | 
|             | 48.0          | ['D5', 'B-4', 'F4', 'B-2']   | 50.0          | ['D5', 'B-4', 'F4', 'B-3']   | False         | 
| chor311.krn |               |                              |               |                              |               | 
|             | 7.0           | ['A4', 'F4', 'C4', 'F3']     | 8.0           | ['A4', 'F4', 'C4', 'F3']     | True          | 
| chor019.krn |               |                              |               |                              |               | 
|             | 0.0           | ['G4', 'D4', 'B-3', 'G3']    | 1.0           | ['G4', 'D4', 'B-3', 'G3']    | True          | 
|             | 7.0           | ['F#4', 'D4', 'A3', 'D3']    | 8.0           | ['F#4', 'D4', 'A3', 'D3']    | True          | 
|             | 16.0          | ['A4', 'F4', 'C4', 'F3']     | 17.0          | ['A4', 'F4', 'C4', 'F3']     | True          | 
|             | 23.0          | ['B-4', 'D4', 'B-3', 'G3']   | 24.0          | ['B-4', 'G4', 'D4', 'G2']    | False         | 
|             | 27.0          | ['F#4', 'D4', 'A3', 'D3']    | 28.0          | ['F#4', 'D4', 'A3', 'D3']    | True          | 
|             | 33.0          | ['F#4', 'D4', 'A3', 'D3']    | 34.0          | ['F#4', 'D4', 'A3', 'D2']    | False         | 
|             | 35.0          | ['G4', 'D4', 'C4', 'G2']     | 35.5          | ['G4', 'D4', 'G2', 'B3']     | False         | 
| chor136.krn |               |                              |               |                              |               | 
|             | 0.0           | ['G4', 'D4', 'B3', 'G2']     | 1.0           | ['B4', 'G4', 'D4', 'G2']     | False         | 
| chor303.krn |               |                              |               |                              |               | 
|             | 13.0          | ['F4', 'C4', 'A3', 'F2']     | 16.0          | ['F4', 'C4', 'A3', 'F3']     | False         | 
| chor248.krn |               |                              |               |                              |               | 
|             | 9.0           | ['B4', 'G4', 'D4', 'G3']     | 10.0          | ['G3', 'G4', 'D4', 'B3']     | False         | 
| chor028.krn |               |                              |               |                              |               | 
|             | 6.0           | ['B4', 'D4', 'F#3', 'B2']    | 8.0           | ['B4', 'F#4', 'D4', 'B2']    | False         | 
|             | 8.0           | ['B4', 'F#4', 'D4', 'B2']    | 9.0           | ['D5', 'F#4', 'B3', 'B3']    | False         | 
|             | 22.0          | ['B4', 'F#4', 'D4', 'B2']    | 24.0          | ['B4', 'F#4', 'D4', 'B3']    | False         | 
| chor101.krn |               |                              |               |                              |               | 
|             | 13.0          | ['B-4', 'F4', 'D4', 'B-2']   | 16.0          | ['B-4', 'F4', 'D4', 'B-2']   | True          | 
|             | 16.0          | ['B-4', 'F4', 'D4', 'B-2']   | 17.0          | ['D5', 'B-4', 'F4', 'B-3']   | False         | 
| chor255.krn |               |                              |               |                              |               | 
|             | 1.0           | ['F#4', 'D4', 'A3', 'D3']    | 2.0           | ['D4', 'F#4', 'A3', 'D3']    | False         | 
|             | 3.0           | ['A4', 'D4', 'A3', 'F#3']    | 4.0           | ['A4', 'A4', 'D4', 'F#3']    | False         | 
|             | 5.0           | ['B4', 'G4', 'D4', 'G3']     | 8.0           | ['B4', 'D4', 'G3', 'G2']     | False         | 
|             | 9.0           | ['E4', 'C#4', 'G3', 'A2']    | 10.0          | ['G3', 'E4', 'C#4', 'A2']    | False         | 
|             | 13.0          | ['F#4', 'D4', 'A3', 'D3']    | 14.0          | ['D4', 'A3', 'F#3', 'D3']    | False         | 
|             | 31.0          | ['A4', 'E4', 'C#4', 'A2']    | 32.0          | ['A4', 'E4', 'C#4', 'A2']    | True          | 
|             | 33.0          | ['A4', 'F#4', 'D4', 'D3']    | 34.0          | ['A4', 'F#4', 'D4', 'D3']    | True          | 
|             | 41.0          | ['B4', 'E4', 'G#3', 'E3']    | 42.0          | ['B4', 'E4', 'G#3', 'E3']    | True          | 
|             | 59.0          | ['E4', 'D4', 'A3', 'A3']     | 60.0          | ['E4', 'C#4', 'A3', 'A2']    | False         | 
| chor110.krn |               |                              |               |                              |               | 
|             | 7.0           | ['C4', 'G3', 'E-3', 'C3']    | 8.0           | ['G4', 'E-4', 'C4', 'C4']    | False         | 
| chor153.krn |               |                              |               |                              |               | 
|             | 4.0           | ['A4', 'D4', 'E3', 'A2']     | 5.0           | ['A4', 'C#4', 'E3', 'A2']    | False         | 
|             | 6.0           | ['F#4', 'D4', 'D3', 'D2']    | 7.0           | ['F#4', 'D4', 'D3', 'D2']    | True          | 
|             | 7.0           | ['F#4', 'D4', 'D3', 'D2']    | 8.0           | ['A4', 'D4', 'F#3', 'D3']    | False         | 
|             | 8.0           | ['A4', 'D4', 'F#3', 'D3']    | 9.0           | ['A4', 'D4', 'F#3', 'D3']    | True          | 
|             | 16.0          | ['E4', 'C#4', 'A3', 'A2']    | 17.0          | ['E4', 'C#4', 'A3', 'A2']    | True          | 
|             | 22.0          | ['A4', 'C#4', 'A3', 'A2']    | 23.0          | ['A2', 'A4', 'C#4', 'A3']    | False         | 
|             | 30.0          | ['B4', 'D4', 'B3', 'B2']     | 31.0          | ['B3', 'B2', 'B4', 'D4']     | False         | 
|             | 32.0          | ['F#4', 'D4', 'A3', 'D3']    | 33.0          | ['F#4', 'D4', 'A3', 'D3']    | True          | 
| chor336.krn |               |                              |               |                              |               | 
| chor224.krn |               |                              |               |                              |               | 
|             | 0.0           | ['F4', 'C4', 'A3', 'F3']     | 1.0           | ['A4', 'F4', 'C4', 'F3']     | False         | 
|             | 7.0           | ['A4', 'C4', 'F3', 'F3']     | 8.0           | ['F4', 'C4', 'A3', 'F3']     | False         | 
|             | 8.0           | ['F4', 'C4', 'A3', 'F3']     | 9.0           | ['C5', 'F4', 'A3', 'F3']     | False         | 
| chor164.krn |               |                              |               |                              |               | 
| chor191.krn |               |                              |               |                              |               | 
|             | 0.0           | ['E4', 'C4', 'A3', 'A2']     | 1.0           | ['A4', 'E4', 'C4', 'A3']     | False         | 
|             | 13.0          | ['E4', 'C4', 'A3', 'A2']     | 16.0          | ['E5', 'A4', 'C4', 'A3']     | False         | 
|             | 31.0          | ['B4', 'D4', 'G3', 'G2']     | 32.0          | ['B4', 'G4', 'D4', 'G3']     | False         | 
| chor040.krn |               |                              |               |                              |               | 
|             | 19.0          | ['D5', 'G4', 'B3', 'G3']     | 20.0          | ['D5', 'G4', 'B3', 'G3']     | True          | 
| chor361.krn |               |                              |               |                              |               | 
|             | 16.0          | ['A4', 'F#4', 'D4', 'D3']    | 17.0          | ['A4', 'A4', 'F#4', 'D4']    | False         | 
| chor213.krn |               |                              |               |                              |               | 
|             | 10.0          | ['F4', 'C4', 'A3', 'F2']     | 12.0          | ['A4', 'F4', 'C4', 'F3']     | False         | 
| chor282.krn |               |                              |               |                              |               | 
|             | 14.0          | ['C5', 'G4', 'E4', 'C3']     | 16.0          | ['E5', 'G4', 'C4', 'C4']     | False         | 
|             | 32.0          | ['E5', 'G4', 'C4', 'C4']     | 33.0          | ['G5', 'C5', 'E4', 'C3']     | False         | 
| chor345.krn |               |                              |               |                              |               | 
|             | 7.0           | ['E4', 'B3', 'G#3', 'E3']    | 8.0           | ['B4', 'E4', 'G#3', 'E3']    | False         | 
|             | 13.0          | ['A4', 'E4', 'C4', 'A2']     | 16.0          | ['C5', 'A4', 'E4', 'A3']     | False         | 
|             | 22.0          | ['C5', 'E4', 'G3', 'C3']     | 23.0          | ['C5', 'E4', 'G3', 'C3']     | True          | 
|             | 23.0          | ['C5', 'E4', 'G3', 'C3']     | 24.0          | ['G4', 'E4', 'C4', 'C3']     | False         | 
|             | 33.0          | ['B4', 'D4', 'G3', 'G3']     | 34.0          | ['D5', 'G4', 'B3', 'G3']     | False         | 
| chor067.krn |               |                              |               |                              |               | 
|             | 14.0          | ['G4', 'B3', 'D3', 'G2']     | 16.0          | ['B4', 'G4', 'D4', 'G2']     | False         | 
|             | 24.0          | ['D5', 'D4', 'G3', 'B2']     | 25.0          | ['D5', 'G4', 'B3', 'G2']     | False         | 
|             | 32.0          | ['B4', 'G4', 'D4', 'G3']     | 33.0          | ['D5', 'G4', 'B3', 'G2']     | False         | 
|             | 40.0          | ['G4', 'E4', 'E3', 'E2']     | 42.0          | ['B4', 'E4', 'G3', 'E3']     | False         | 
| chor366.krn |               |                              |               |                              |               | 
|             | 7.0           | ['C#5', 'E4', 'A3', 'A2']    | 8.0           | ['C#5', 'A4', 'E4', 'A3']    | False         | 
|             | 9.0           | ['E5', 'A4', 'E4', 'C#4']    | 10.0          | ['E5', 'A4', 'E4', 'C#3']    | False         | 
|             | 15.0          | ['G#4', 'E4', 'B3', 'E3']    | 16.0          | ['E4', 'B3', 'G#3', 'E3']    | False         | 
|             | 27.0          | ['C#5', 'E4', 'A3', 'A3']    | 28.0          | ['E5', 'C#4', 'A3', 'A3']    | False         | 
|             | 43.0          | ['C#5', 'A3', 'E3', 'C#3']   | 44.0          | ['E3', 'E5', 'A4', 'C#3']    | False         | 
| chor268.krn |               |                              |               |                              |               | 
|             | 7.0           | ['E5', 'G4', 'C4', 'C3']     | 8.0           | ['E5', 'G4', 'C4', 'C3']     | True          | 
|             | 8.0           | ['E5', 'G4', 'C4', 'C3']     | 9.0           | ['E5', 'G4', 'E4', 'C4']     | False         | 
|             | 15.0          | ['C5', 'E4', 'G3', 'C3']     | 16.0          | ['C5', 'E4', 'G3', 'C3']     | True          | 
|             | 23.0          | ['A4', 'E4', 'C4', 'A2']     | 24.0          | ['A4', 'E4', 'C4', 'A3']     | False         | 
|             | 29.0          | ['G4', 'D4', 'B3', 'G2']     | 30.0          | ['G4', 'D4', 'B3', 'G3']     | False         | 
|             | 39.0          | ['F5', 'F4', 'D4', 'D3']     | 40.0          | ['F5', 'A4', 'F4', 'D4']     | False         | 
|             | 57.0          | ['G4', 'D4', 'B3', 'G2']     | 58.0          | ['G4', 'D4', 'B3', 'G2']     | True          | 
| chor354.krn |               |                              |               |                              |               | 
|             | 9.0           | ['B4', 'G4', 'D4', 'G3']     | 10.0          | ['G3', 'G4', 'D4', 'B3']     | False         | 
| chor276.krn |               |                              |               |                              |               | 
|             | 3.0           | ['D5', 'G4', 'B3', 'G3']     | 4.0           | ['D5', 'G4', 'G3', 'B3']     | False         | 
|             | 13.0          | ['D5', 'D4', 'F#4', 'D3']    | 16.0          | ['D5', 'F#4', 'D4', 'D3']    | False         | 
| chor339.krn |               |                              |               |                              |               | 
|             | 23.0          | ['E5', 'C5', 'C4', 'E3']     | 24.0          | ['E5', 'C5', 'E4', 'C3']     | False         | 
|             | 27.0          | ['C5', 'G4', 'E4', 'C3']     | 28.0          | ['E5', 'G4', 'C4', 'C3']     | False         | 
| chor299.krn |               |                              |               |                              |               | 
|             | 4.0           | ['D5', 'A-4', 'F4', 'B-3']   | 5.0           | ['D5', 'A-4', 'F4', 'B-2']   | False         | 
|             | 10.0          | ['E-5', 'G4', 'D4', 'C3']    | 11.0          | ['G4', 'E-5', 'C4', 'E-3']   | False         | 
|             | 14.0          | ['C5', 'F4', 'B-3', 'F3']    | 15.0          | ['C5', 'F4', 'A3', 'F2']     | False         | 
|             | 34.0          | ['E-4', 'B-3', 'G3', 'E-3']  | 36.0          | ['B-4', 'G4', 'E-4', 'E-4']  | False         | 
|             | 41.0          | ['D5', 'G4', 'D4', 'B2']     | 41.5          | ['G4', 'E-5', 'B3', 'G2']    | False         | 
| chor048.krn |               |                              |               |                              |               | 
|             | 2.0           | ['C5', 'E4', 'A3', 'A3']     | 3.0           | ['C5', 'E4', 'A3', 'A2']     | False         | 
|             | 3.0           | ['C5', 'E4', 'A3', 'A2']     | 4.0           | ['C5', 'E4', 'A3', 'A3']     | False         | 
|             | 6.0           | ['E5', 'G4', 'C4', 'C4']     | 7.0           | ['E5', 'G4', 'C4', 'C3']     | False         | 
|             | 7.0           | ['E5', 'G4', 'C4', 'C3']     | 8.0           | ['E5', 'G4', 'C4', 'C4']     | False         | 
|             | 14.0          | ['A4', 'E4', 'C#4', 'A2']    | 16.0          | ['E5', 'A4', 'C#4', 'A3']    | False         | 
|             | 22.0          | ['E5', 'G4', 'D4', 'D3']     | 23.0          | ['D5', 'F#4', 'A3', 'D3']    | False         | 
|             | 30.0          | ['C5', 'F4', 'C4', 'C3']     | 31.0          | ['C5', 'E4', 'G3', 'C3']     | False         | 
|             | 38.0          | ['A4', 'D4', 'A3', 'A3']     | 39.0          | ['A4', 'C#4', 'E3', 'A2']    | False         | 
| chor306.krn |               |                              |               |                              |               | 
|             | 4.0           | ['D4', 'E-4', 'G3', 'C3']    | 5.0           | ['G4', 'E-4', 'C4', 'C3']    | False         | 
|             | 7.0           | ['B-4', 'D4', 'G3', 'G2']    | 8.0           | ['B-4', 'G4', 'D4', 'G3']    | False         | 
|             | 12.0          | ['E-4', 'C4', 'G3', 'C3']    | 13.0          | ['G4', 'E-4', 'C4', 'C3']    | False         | 
|             | 23.0          | ['E-4', 'B-3', 'G3', 'E-2']  | 24.0          | ['E-5', 'B-4', 'G3', 'E-2']  | False         | 
|             | 40.0          | ['G4', 'E-4', 'B-3', 'E-3']  | 41.0          | ['B-4', 'G4', 'E-4', 'E-3']  | False         | 
|             | 55.0          | ['F4', 'E-4', 'B-3', 'B-2']  | 56.0          | ['B-4', 'F4', 'D4', 'B-3']   | False         | 
| chor281.krn |               |                              |               |                              |               | 
|             | 0.0           | ['G4', 'D4', 'B-3', 'G2']    | 1.0           | ['G4', 'D4', 'B-3', 'G3']    | False         | 
|             | 31.0          | ['B-4', 'F4', 'D4', 'B-2']   | 32.0          | ['D5', 'B-4', 'F4', 'B-3']   | False         | 
| chor273.krn |               |                              |               |                              |               | 
|             | 15.0          | ['D4', 'A3', 'F#3', 'D3']    | 16.0          | ['D4', 'D4', 'F#3', 'D3']    | False         | 
| chor305.krn |               |                              |               |                              |               | 
|             | 30.0          | ['F#4', 'D4', 'A3', 'D3']    | 32.0          | ['F#4', 'D4', 'A3', 'D3']    | True          | 
|             | 34.0          | ['E4', 'C#4', 'A3', 'A3']    | 35.0          | ['E4', 'C#4', 'A3', 'A3']    | True          | 
| chor158.krn |               |                              |               |                              |               | 
|             | 15.0          | ['G4', 'D4', 'B3', 'G2']     | 16.0          | ['G4', 'D4', 'B3', 'G3']     | False         | 
|             | 57.0          | ['E4', 'C4', 'G3', 'C3']     | 58.0          | ['C3', 'C4', 'G3', 'E3']     | False         | 
| chor054.krn |               |                              |               |                              |               | 
| chor098.krn |               |                              |               |                              |               | 
|             | 11.0          | ['C#5', 'F#4', 'B3', 'F#3']  | 12.0          | ['C#5', 'F#4', 'A#3', 'F#2'] | False         | 
|             | 13.0          | ['B4', 'D4', 'B3', 'B2']     | 16.0          | ['D5', 'B4', 'F#4', 'B3']    | False         | 
|             | 22.0          | ['D5', 'D3', 'F#4', 'A3']    | 23.0          | ['D5', 'F#4', 'A3', 'D3']    | False         | 
|             | 23.0          | ['D5', 'F#4', 'A3', 'D3']    | 24.0          | ['A4', 'F#4', 'D4', 'D3']    | False         | 
| chor368.krn |               |                              |               |                              |               | 
|             | 24.0          | ['G4', 'E4', 'C4', 'C3']     | 27.0          | ['E5', 'G4', 'C4', 'C3']     | False         | 
|             | 45.0          | ['G5', 'G4', 'C4', 'E3']     | 46.0          | ['C4', 'C5', 'G4', 'E3']     | False         | 
|             | 49.0          | ['F3', 'D5', 'B-3', 'B-2']   | 50.0          | ['B-2', 'B-4', 'F4', 'D4']   | False         | 
|             | 51.0          | ['G4', 'F4', 'G3', 'C3']     | 52.0          | ['G4', 'E4', 'C4', 'C3']     | False         | 
| chor009.krn |               |                              |               |                              |               | 
|             | 16.0          | ['A4', 'F#4', 'D4', 'D3']    | 17.0          | ['A4', 'A4', 'F#4', 'D4']    | False         | 
| chor069.krn |               |                              |               |                              |               | 
|             | 19.0          | ['G4', 'D4', 'B3', 'G2']     | 20.0          | ['G4', 'D4', 'B3', 'G3']     | False         | 
|             | 24.0          | ['D5', 'F#4', 'A3', 'F#3']   | 25.0          | ['D5', 'F#4', 'A3', 'F#3']   | True          | 
|             | 35.0          | ['B4', 'G4', 'D4', 'G2']     | 36.0          | ['G4', 'D5', 'B3', 'G3']     | False         | 
|             | 61.0          | ['A4', 'E4', 'C4', 'A2']     | 62.0          | ['C5', 'E4', 'A3', 'A3']     | False         | 
| chor258.krn |               |                              |               |                              |               | 
|             | 33.0          | ['D5', 'G4', 'D4', 'B2']     | 34.0          | ['B2', 'D5', 'G4', 'B3']     | False         | 
| chor157.krn |               |                              |               |                              |               | 
|             | 15.0          | ['F4', 'C4', 'A3', 'F2']     | 16.0          | ['C5', 'F4', 'A3', 'F3']     | False         | 
| chor223.krn |               |                              |               |                              |               | 
|             | 7.0           | ['C4', 'G3', 'E3', 'C2']     | 8.0           | ['C4', 'G3', 'E3', 'C3']     | False         | 
|             | 41.0          | ['E4', 'E4', 'G3', 'C#3']    | 42.0          | ['F#4', 'B3', 'A3', 'D#3']   | False         | 
| chor177.krn |               |                              |               |                              |               | 
|             | 0.0           | ['C#5', 'A4', 'E4', 'A2']    | 1.0           | ['C#5', 'A4', 'E4', 'A3']    | False         | 
|             | 15.0          | ['B4', 'E4', 'A3', 'E3']     | 16.0          | ['E4', 'B4', 'G#3', 'E3']    | False         | 
|             | 17.0          | ['A4', 'C#4', 'E3', 'A2']    | 20.0          | ['C#5', 'A4', 'E4', 'A2']    | False         | 
|             | 35.0          | ['B4', 'E4', 'A3', 'E3']     | 36.0          | ['E4', 'B4', 'G#3', 'E3']    | False         | 
| chor187.krn |               |                              |               |                              |               | 
|             | 13.0          | ['E5', 'G4', 'D4', 'C3']     | 14.0          | ['E5', 'G4', 'C4', 'C2']     | False         | 
|             | 15.0          | ['D5', 'G4', 'B3', 'G2']     | 16.0          | ['D5', 'G4', 'B3', 'G3']     | False         | 
|             | 31.0          | ['G4', 'D4', 'C4', 'G2']     | 31.5          | ['G4', 'D4', 'G2', 'B3']     | False         | 
| chor328.krn |               |                              |               |                              |               | 
|             | 0.0           | ['B4', 'D4', 'G3', 'G2']     | 1.0           | ['A4', 'D4', 'B3', 'G3']     | False         | 
|             | 16.0          | ['G4', 'D4', 'B3', 'G2']     | 20.0          | ['D4', 'B3', 'G3', 'G2']     | False         | 
|             | 26.0          | ['F#4', 'D4', 'A3', 'D3']    | 27.0          | ['D4', 'A3', 'F#3', 'D3']    | False         | 
|             | 30.0          | ['G4', 'E4', 'E3', 'C3']     | 31.0          | ['G4', 'E4', 'G3', 'C3']     | False         | 
| chor002.krn |               |                              |               |                              |               | 
|             | 7.0           | ['E4', 'B3', 'G#3', 'E2']    | 8.0           | ['B4', 'G#4', 'E4', 'E3']    | False         | 
| chor290.krn |               |                              |               |                              |               | 
|             | 0.0           | ['B4', 'G#4', 'E4', 'E3']    | 1.0           | ['B4', 'F#4', 'B3', 'E3']    | False         | 
|             | 9.0           | ['G#4', 'E4', 'B3', 'E3']    | 10.0          | ['E3', 'E4', 'B3', 'G#3']    | False         | 
|             | 31.0          | ['G#4', 'F#4', 'C#4', 'C#3'] | 32.0          | ['G#4', 'E#4', 'C#4', 'C#4'] | False         | 
| chor088.krn |               |                              |               |                              |               | 
|             | 0.0           | ['A4', 'E4', 'C4', 'A2']     | 1.0           | ['A4', 'E4', 'C4', 'A3']     | False         | 
|             | 13.0          | ['A4', 'E4', 'C4', 'A2']     | 16.0          | ['E5', 'A4', 'C4', 'A2']     | False         | 
|             | 21.0          | ['B4', 'E4', 'G#3', 'E3']    | 24.0          | ['B4', 'G#4', 'E4', 'E3']    | False         | 
| chor030.krn |               |                              |               |                              |               | 
|             | 10.0          | ['E4', 'B3', 'G3', 'E2']     | 12.0          | ['G4', 'E4', 'B3', 'E3']     | False         | 
|             | 22.0          | ['E4', 'B3', 'G3', 'E3']     | 24.0          | ['G4', 'E4', 'B3', 'E3']     | False         | 
| chor201.krn |               |                              |               |                              |               | 
|             | 4.0           | ['E-4', 'D4', 'G3', 'C3']    | 5.0           | ['G4', 'E-4', 'C4', 'C3']    | False         | 
|             | 7.0           | ['B-4', 'D4', 'G3', 'G2']    | 8.0           | ['B-4', 'G4', 'D4', 'G3']    | False         | 
|             | 12.0          | ['E-4', 'C4', 'G3', 'C3']    | 13.0          | ['G4', 'E-4', 'C4', 'C3']    | False         | 
|             | 23.0          | ['E-4', 'B-3', 'G3', 'E-2']  | 24.0          | ['E-5', 'B-4', 'G3', 'E-2']  | False         | 
|             | 40.0          | ['G4', 'E-4', 'B-3', 'E-3']  | 41.0          | ['B-4', 'G4', 'E-4', 'E-3']  | False         | 
|             | 55.0          | ['F4', 'E-4', 'B-3', 'B-2']  | 56.0          | ['B-4', 'F4', 'D4', 'B-3']   | False         | 
| chor032.krn |               |                              |               |                              |               | 
|             | 0.0           | ['E5', 'A4', 'C#4', 'A2']    | 1.0           | ['E5', 'A4', 'C#4', 'A3']    | False         | 
|             | 16.0          | ['B4', 'G#4', 'B3', 'E3']    | 17.0          | ['B4', 'E4', 'G#3', 'E3']    | False         | 
| chor272.krn |               |                              |               |                              |               | 
| chor183.krn |               |                              |               |                              |               | 
|             | 15.0          | ['G4', 'B3', 'D3', 'G2']     | 16.0          | ['G4', 'D4', 'B3', 'G3']     | False         | 
|             | 31.0          | ['G4', 'E4', 'B3', 'E3']     | 32.0          | ['B4', 'E4', 'G3', 'E3']     | False         | 
| chor090.krn |               |                              |               |                              |               | 
|             | 0.0           | ['B-4', 'F4', 'D4', 'B-3']   | 1.0           | ['B-4', 'F4', 'D4', 'B-3']   | True          | 
|             | 14.0          | ['B-4', 'F4', 'D4', 'B-2']   | 15.0          | ['F5', 'B-4', 'D4', 'B-2']   | False         | 
| chor046.krn |               |                              |               |                              |               | 
|             | 7.0           | ['D5', 'F#4', 'A3', 'D3']    | 8.0           | ['D5', 'F#4', 'A3', 'D3']    | True          | 
|             | 9.0           | ['D5', 'A4', 'D4', 'F#3']    | 10.0          | ['A4', 'F#4', 'D4', 'F#3']   | False         | 
|             | 15.0          | ['F#4', 'D4', 'A3', 'D3']    | 16.0          | ['F#4', 'D4', 'A3', 'D3']    | True          | 
| chor217.krn |               |                              |               |                              |               | 
|             | 9.0           | ['A4', 'F#4', 'D4', 'D3']    | 12.0          | ['A4', 'F#4', 'D4', 'D3']    | True          | 
| chor117.krn |               |                              |               |                              |               | 
|             | 3.0           | ['C5', 'A-4', 'E-4', 'A-3']  | 4.0           | ['A-3', 'E-5', 'C5', 'C4']   | False         | 
|             | 9.0           | ['E-5', 'A-4', 'E-4', 'C3']  | 10.0          | ['E-5', 'A-4', 'E-4', 'C3']  | True          | 
| chor165.krn |               |                              |               |                              |               | 
|             | 15.0          | ['F4', 'C4', 'A3', 'F2']     | 16.0          | ['A4', 'F4', 'C4', 'F3']     | False         | 
|             | 16.0          | ['A4', 'F4', 'C4', 'F3']     | 17.0          | ['A4', 'F4', 'C4', 'F3']     | True          | 
| chor057.krn |               |                              |               |                              |               | 
|             | 7.0           | ['G#4', 'E4', 'B3', 'E3']    | 8.0           | ['E5', 'G#4', 'B3', 'E3']    | False         | 
| chor068.krn |               |                              |               |                              |               | 
| chor230.krn |               |                              |               |                              |               | 
|             | 0.0           | ['G4', 'D4', 'B-3', 'G2']    | 1.0           | ['G4', 'D4', 'B-3', 'G3']    | False         | 
|             | 7.0           | ['D5', 'F4', 'B-3', 'B-2']   | 8.0           | ['D5', 'F4', 'B-3', 'B-2']   | True          | 
|             | 23.0          | ['D5', 'F4', 'B-3', 'B-2']   | 24.0          | ['D5', 'F4', 'B-3', 'B-2']   | True          | 
|             | 24.0          | ['D5', 'F4', 'B-3', 'B-2']   | 25.0          | ['D5', 'F4', 'B-3', 'B-2']   | True          | 
|             | 25.0          | ['D5', 'F4', 'B-3', 'B-2']   | 26.0          | ['D5', 'F4', 'B-3', 'D3']    | False         | 
|             | 33.0          | ['B-4', 'G4', 'D4', 'G2']    | 34.0          | ['D5', 'B-4', 'B-3', 'G3']   | False         | 
| chor124.krn |               |                              |               |                              |               | 
|             | 0.0           | ['B4', 'G4', 'D4', 'G3']     | 1.0           | ['B4', 'G4', 'D4', 'G3']     | True          | 
|             | 7.0           | ['C5', 'A4', 'C4', 'A2']     | 8.0           | ['C5', 'E4', 'A3', 'A2']     | False         | 
|             | 9.0           | ['B4', 'G4', 'D4', 'G2']     | 10.0          | ['G4', 'D4', 'B3', 'G3']     | False         | 
| chor146.krn |               |                              |               |                              |               | 
|             | 7.0           | ['G#4', 'E4', 'B3', 'E3']    | 9.0           | ['E4', 'B3', 'G#3', 'E3']    | False         | 
| chor350.krn |               |                              |               |                              |               | 
|             | 6.0           | ['C5', 'A4', 'F4', 'F3']     | 7.0           | ['C5', 'A4', 'F4', 'F3']     | True          | 
|             | 22.0          | ['C5', 'E-4', 'G3', 'C3']    | 24.0          | ['E-5', 'G4', 'C4', 'C4']    | False         | 
|             | 38.0          | ['C5', 'F4', 'A3', 'F3']     | 39.0          | ['C5', 'F4', 'A3', 'F3']     | True          | 
|             | 46.0          | ['B-4', 'F4', 'D4', 'B-2']   | 47.0          | ['B-4', 'F4', 'D4', 'B-2']   | True          | 



This would suggest that, in the context of an **automatic voice leading algorithm**, 
if two identical harmonies appear contiguously, they should be voiced differently. 
For example, by changing the position in the three upper voices and/or changing the octave of the bass. 
