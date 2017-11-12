# #NotAnAccident Visualization of Gun Violence / Death Data

## What is this project?

This project is part of Wesleyan's 2017 Data Dive; we aimed to
leverage some of the work that Prof. Oleinikov did, using
the **GDELT API [insert link here]** to scrape stories about gun
data from the web, and leveraging the work that @artzub has done in his World Bank Global Development Sprint project, which visualized World Bank contracts in a brilliant way, leveraging d3.js.

The Open Source Project he wrote to allow this sort of visualization, blackhole.js, is cool, but its documentation left a lot to be desired.

### Proximal Goals of Project

So, our project over the weekend was seeing how we could re-engineer his work to visualize Gun Violence / Death Data across the USA, specifically with a focus on gun 'accidents' involving children.

We tried to tune our GDELT queries to glean different sorts of gun violence data, so we could classify the data by the 'type' of incident. We had limited success with this -- ultimately, some sort of Machine Learning classifer would need to be built to do this effectively, using hand-labeled categories to train the algorithm.

### Ultimate Goals of Project

We really liked seeing the visualizations that our jerry-rigging of project provided; we would like to extend his project
to have better documentation / support for generalized datasets, to allow for better visualization of temporal long/lat
(or positional data writ large) visualization.


## How to run?

Run `python -m SimpleHTTPServer` in the current directory, and it will serve
the website. Now, just to screw around with the stuff in the folder and make
it exactly what we want.

Also, 2013.csv is the csv file being automatically read in, for reasons instantaneously unclear
to me (perhaps because it's the csv last alphabetically).

Also, I'm still looking for where the long lat data is stored for 'where' each country is, exactly.

## Where is the data coming from?

The data is currently always read in from a file called `2013.csv`, by default.
Our aim is to reverse engineer how the script works, so we can load any/all
files within a certain folder in the current working directory.

This work is to come.

## Where are the datasets coming from?

Currently, they're pseudo-hand-labelled from GDELT; the link to the repository
with the scraper is here [insert link here]. In future, when we write the
classifier, it will also be in this repo.
