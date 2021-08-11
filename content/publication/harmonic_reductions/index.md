---
title: "Harmonic Reductions As a Strategy for Creative Data Augmentation"
authors:
- admin
- Ichiro Fujinaga
date: "2020-10-12T00:00:00Z"
doi: ""

# Schedule page publish date (NOT publication's date).
publishDate: "2020-10-12T00:00:00Z"

# Publication type.
# Legend: 0 = Uncategorized; 1 = Conference paper; 2 = Journal article;
# 3 = Preprint / Working Paper; 4 = Report; 5 = Book; 6 = Book section;
# 7 = Thesis; 8 = Patent
publication_types: ["1"]

# Publication name and optional abbreviated publication name.
publication: "Late-Breaking Demo in *21st International Society for Music Information Retrieval Conference*"
publication_short: "In *ISMIR 2020*"

abstract: "In this paper, we introduce a technique for generating large collections of artificial training examples, which can be used to train chord labeling, key detection, and roman numeral analysis models. The technique consists of using roman numeral analysis annotations of existing datasets to generate harmonic reductions of the chords implied by the original annotations. The artificially generated examples ignore the original notes of the annotated example (i.e., the specific *voicings* of the chords), replacing them with voicings suggested by a rule-based voice leading algorithm. A relatively large number of artificial examples can be generated from a single annotated progression using this technique. For example, 10 different voicings in 12 different keys would result in 120 artificial examples generated out of one annotated chord progression. The voicings suggested for different keys do not necessarily overlap, given that the range of the voices and other variables are taken into account by the rule-based algorithm. This results in data augmentation with potentially unique voicings in each key, contrary to what would be obtained by simply transposing the artificial examples to a different key. We show the process of applying this technique to a dataset of annotated Bach chorales from the KernScores website. Similar datasets with roman numeral analysis annotations could be used with this approach to generate a large number of artificial training examples for training machine learning models."

# Summary. An optional shortened abstract.
summary: "A preliminary experiment on harmonic reductions as a data augmentation strategy in tonal MIR tasks"

# tags:
# - Source Themes
featured: false

links:
- name: ISMIR Website
  url: https://program.ismir2020.net/lbd_432.html
url_pdf: "media/harmonic_reductions/napoleslopez20harmonic.pdf"
# url_code: "https://github.com/DDMAL/key_modulation_dataset"
# url_dataset: "https://github.com/DDMAL/key_modulation_dataset"
url_poster: 'media/harmonic_reductions/napoleslopez20harmonic_poster.pdf'
# url_project: ''
# url_slides: "media/modulation_tonicization/napoleslopez20local_slides.pdf"
# url_source: '#'
# url_video: '#'

# Featured image
# To use, add an image named `featured.jpg/png` to your page's folder.
image:
  caption: 'Original phrase of a Bach Chorale (above) and artificial harmonic reduction generated from the roman numeral annotations (below)'
  focal_point: ""
  preview_only: false

# Associated Projects (optional).
#   Associate this publication with one or more of your projects.
#   Simply enter your project's folder or file name without extension.
#   E.g. `internal-project` references `content/project/internal-project/index.md`.
#   Otherwise, set `projects: []`.
# projects:
# - internal-project

# Slides (optional).
#   Associate this publication with Markdown slides.
#   Simply enter your slide deck's filename without extension.
#   E.g. `slides: "example"` references `content/slides/example/index.md`.
#   Otherwise, set `slides: ""`.
slides: ""
---
