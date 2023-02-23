# Progetto-EEG
In Progetto EEG sono presenti 4 file, uno relativo a delle funzioni utili per tale progetto, uno relativo ai dati analizzati, uno relativo al file scritto in RMarkdown per produrre tutto il progetto e l'ultimo è il file pdf risultante dall'RMarkdown.

Questo progetto è un'analisi di dati *EEG* (elettroencefalogramma) relativi ad un esperimento in cui è stata misurata la risposta cerebrale di 20 soggetti a 5 stimoli visivi (4 immagini di facce rappresentanti espressioni di digusto, paura, felicità e neutre e 1 immagine relativa ad un oggetto).
L'obiettivo del progetto è di analizzare le differenze fra i vari stimoli (in particolare tra gli stimoli delle facce e lo stimolo dell'oggetto) attorno al picco P170/N170, e di come tali differenze, se presenti, si manifestino tra le varie aree cerebrali (e tra i vari canali).
Nell'analizzare tali differenze vengono confrontati sia vari metodi per la selezione e l'accorpamento delle osservazioni attorno al picco, sia vari approcci per saggiare e analizzare le differenze prodotte dai differenti stimoli nelle varie aree cerebrali.
Le analisi sono state svolte utilizzando *R* e appoggiandosi principalmente al pacchetto *eeguana*, che permette di strutturare e analizzare comodamente dati derivati dall'elettroencefalogramma, grazie alla sua forte affinità con il linguaggio *tidy* relativo al tidyverse di R.

La modellazione di questi tipi di dati è stata effettuata tramite modelli ad effetti misti e test di permutazione multivariati, per cercare di cogliere sia l’effetto dovuto alla specificità dei soggetti (dipendenza tra osservazioni), che l’effetto dovuto alla correlazione tra i vari canali/aree cerebrali (dipendenza tra variabili).
I risultati di questi approcci hanno mostrato come sia stato raggiunto un notevole adattamento dei modelli ai dati.

 
