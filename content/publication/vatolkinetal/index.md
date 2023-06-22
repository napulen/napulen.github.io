---
title: "Musical Genre Recognition Based on Deep Descriptors of Harmony, Instrumentation, and Segments"
authors:
- Igor Vatolkin
- Mark Gotham
- admin
- Fabian Ostermann
date: "2023-04-12T00:00:00Z"
doi: ""

# Schedule page publish date (NOT publication's date).
publishDate: "2023-04-12T00:00:00Z"

# Publication type.
# Legend: 0 = Uncategorized; 1 = Conference paper; 2 = Journal article;
# 3 = Preprint / Working Paper; 4 = Report; 5 = Book; 6 = Book section;
# 7 = Thesis; 8 = Patent
publication_types: ["1"]

# Publication name and optional abbreviated publication name.
publication: "In Proceedings of the Artificial Intelligence in Music, Sound, Art and Design: 12th International Conference"
publication_short: "In *EvoStar 2023*"

abstract: "Deep learning has recently established itself as a cluster of methods of choice for almost all classification tasks in music information retrieval. However, despite very good classification performance, it sometimes brings disadvantages including long training times and higher energy costs, lower interpretability of classification models, or an increased risk of overfitting when applied to small training sets due to a very large number of trainable parameters. In this paper, we investigate the combination of both deep and shallow algorithms for recognition of musical genres using a transfer learning approach. We train deep classification models once to predict harmonic, instrumental, and segment properties from datasets with respective annotations. Their predictions for another dataset with annotated genres are used as features for shallow classification methods. They can be trained over and again for different categories, and are particularly useful when the training sets are small, in a real world scenario when listeners define various musical categories selecting only a few prototype tracks. The experiments show the potential of the proposed approach for genre recognition. In particular, when combined with evolutionary feature selection which identifies the most relevant deep feature dimensions, the classification errors became significantly lower in almost all cases, compared to a baseline based on MFCCs or results reported in the previous work."

# Summary. An optional shortened abstract.
summary: "An exploration of deep and shallow models for the recognition of musical genres."

# tags:
# - Source Themes
featured: true

links:
url_pdf: "media/vatolkinetal/vatolkin23musical.pdf"
url_doi: "10.1007/978-3-031-29956-8_27"
url_poster: 'media/vatolkinetal/poster.pdf'
# url_project: ''
# url_slides: "media/modulation_tonicization/napoleslopez20local_slides.pdf"
# url_source: '#'

# Featured image
# To use, add an image named `featured.jpg/png` to your page's folder.
image:
  caption: 'Diagram taken from the paper.'
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