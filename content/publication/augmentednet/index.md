---
title: "AugmentedNet: A Roman Numeral Analysis Network with Synthetic Training Examples and Additional Tonal Tasks"
authors:
- admin
- Mark Gotham
- Ichiro Fujinaga
date: "2021-11-08T00:00:00Z"
doi: ""

# Schedule page publish date (NOT publication's date).
publishDate: "2021-08-05T00:00:00Z"

# Publication type.
# Legend: 0 = Uncategorized; 1 = Conference paper; 2 = Journal article;
# 3 = Preprint / Working Paper; 4 = Report; 5 = Book; 6 = Book section;
# 7 = Thesis; 8 = Patent
publication_types: ["3"]

# Publication name and optional abbreviated publication name.
publication: "UPCOMING In Proceedings of the *21st International Society for Music Information Retrieval Conference*"
publication_short: "In *ISMIR 2021*"

abstract: "AugmentedNet is a new convolutional recurrent neural network for predicting Roman numeral labels. The network architecture is characterized by a separate convolutional block for bass and chromagram inputs. This layout is further enhanced by using synthetic training examples for data augmentation, and a greater number of tonal tasks to solve simultaneously via multitask learning. This paper reports the improved performance achieved by combining these ideas. The additional tonal tasks strengthen the shared representation learned through multitask learning. The synthetic examples, in turn, complement key transposition, which is often the only technique used for data augmentation in similar problems related to tonal music. The name 'AugmentedNet' speaks to the increased number of both training examples and tonal tasks. We report on tests across six relevant and publicly available datasets: ABC, BPS, HaydnSun, TAVERN, When-in-Rome, and WTC. In our tests, our model outperforms recent methods of functional harmony, such as other convolutional neural networks and Transformer-based models. Finally, we show a new method for reconstructing the full Roman numeral label, based on common Roman numeral classes, which leads to better results compared to previous methods."

# Summary. An optional shortened abstract.
summary: "A new CRNN for automatic Roman numeral analysis."

# tags:
# - Source Themes
featured: true

# links:
# - name: ISMIR Website
#   url: https://program.ismir2020.net/poster_3-14.html
url_pdf: "media/augmentednet/napoles21augmentednet.pdf"
url_code: "https://github.com/napulen/AugmentedNet"
# url_dataset: "https://github.com/DDMAL/key_modulation_dataset"
# url_poster: 'media/mendelssohn/degrootmaggetti20data_poster.pdf'
# url_project: ''
# url_slides: "media/modulation_tonicization/napoleslopez20local_slides.pdf"
# url_source: '#'
# url_video: '#'

# Featured image
# To use, add an image named `featured.jpg/png` to your page's folder.
image:
  caption: 'AugmentedNet. Diagram taken from the paper.'
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
