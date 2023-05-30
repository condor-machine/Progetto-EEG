# Progetto-EEG
In questa repository sono presenti 4 file, uno relativo a delle funzioni utili per tale progetto, uno relativo ai dati analizzati, uno relativo al file scritto in RMarkdown per produrre tutto il progetto e l'ultimo è il file pdf risultante dall'RMarkdown.

Questo progetto è un'analisi di dati *EEG* (elettroencefalogramma) relativi ad un esperimento in cui è stata misurata la risposta cerebrale di 20 soggetti a 5 stimoli visivi (4 immagini di facce rappresentanti espressioni di digusto, paura, felicità e neutre e 1 immagine relativa ad un oggetto).
L'obiettivo del progetto è di analizzare le differenze fra i vari stimoli (in particolare tra gli stimoli delle facce e lo stimolo dell'oggetto) attorno al picco P170/N170, e di come tali differenze, se presenti, si manifestino tra le varie aree cerebrali (e tra i vari canali).
Nell'analizzare tali differenze vengono confrontati sia vari metodi per la selezione e l'accorpamento delle osservazioni attorno al picco, sia vari approcci per saggiare e analizzare le differenze prodotte dai differenti stimoli nelle varie aree cerebrali.
Le analisi sono state svolte utilizzando *R* e appoggiandosi principalmente al pacchetto *eeguana*, che permette di strutturare e analizzare comodamente dati derivati dall'elettroencefalogramma, grazie alla sua forte affinità con il linguaggio *tidy* relativo al tidyverse di R.

La modellazione di questi tipi di dati è stata effettuata tramite **modelli ad effetti misti** e **test di permutazione multivariati**, per cercare di cogliere sia l’effetto dovuto alla specificità dei soggetti (dipendenza tra osservazioni), che l’effetto dovuto alla correlazione tra i vari canali/aree cerebrali (dipendenza tra variabili).
I risultati di questi approcci hanno mostrato come sia stato raggiunto un notevole adattamento dei modelli ai dati.

 
 # EEG-Project
In this repository there are 4 files, one related to useful functions for this project, one related to the analyzed data, one related to the file written in RMarkdown to produce the whole project, and the last one is the pdf file resulting from the RMarkdown.

This project is an analysis of *EEG* (electroencephalogram) data related to an experiment in which the brain response of 20 subjects to 5 visual stimuli (4 images of faces representing expressions of digust, fear, happiness and neutral and 1 image related to an object) was measured.
The goal of the project is to analyze the differences between the various stimuli (particularly between the face stimuli and the object stimulus) around the P170/N170 peak, and how these differences, if any, are manifested across brain areas (and across channels).
In analyzing these differences, both various methods for selecting and grouping observations around the peak and various approaches for assaying and analyzing the differences produced by different stimuli in different brain areas are compared.
Analyses were carried out using *R* and relying primarily on the *eeguana* package, which allows convenient structuring and analysis of electroencephalogram-derived data due to its strong affinity with the *tidy* language related to R's tidyverse.

The modeling of these types of data was done through **mixed-effects** models and **multivariate permutation tests**, to try to capture both the effect due to subject specificity (inter-observation dependence) and the effect due to correlation between different brain channels/areas (inter-variable dependence).
The results of these approaches showed that a remarkable fit of the models to the data was achieved.


