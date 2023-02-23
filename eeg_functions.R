library(tidyverse)
library(eeguana)




# funzione per aggregare il potenziale per soggetto-condizione-canale in una eeg_lst
# scegliendo il metodo di accorpamento e l'intervallo temporale in cui accorpare 

iso_pick <- function(eeg_lst, interval_ms = c(155,170), sampl_rate_hz = 500, method='mean', ...){
  
  int_ms_l <- round(interval_ms[1]*sampl_rate_hz/1000)
  int_ms_u <- round(interval_ms[2]*sampl_rate_hz/1000)
  
  
  # filtraggio valori nel range scelto
  eeg_aggr <- eeg_lst %>% filter(.sample >= {{int_ms_l}} & .sample <= {{int_ms_u}})
  
  # aggregazione secondo il metodo scelto
  # metodi disponibili: mean, max, min-max 
  
  if(method == 'mean'){
    eeg_aggr <- eeg_aggr %>% group_by(condition,.subj) %>% summarize_all(mean, ...)
  }
  
  if(method == 'max'){
    eeg_aggr <- eeg_aggr %>% group_by(condition,.subj) %>% summarize_all(max)
  }
  
  if(method == 'min-max'){
    inter_len <- int_ms_u - int_ms_l + 1
    int_ms_m <- round(inter_len/2)
    
    eeg_aggr <- eeg_aggr %>% group_by(condition,.subj) %>%
      summarize_all(function(x){max(x[1:{{int_ms_m}}]) - min(x[({{int_ms_m}}+1):{{inter_len}}])}) 
  }
  
  return(eeg_aggr)
  
}


# funzione per accorpare con la media il potenziale 
# dei vari canali in aree cerebrali

transmute_area <- function(eeg_lst){
  eeg_lst %>% 
    transmute(
      Frontal = chs_mean(Fp1, Fp2, F3, F4, F7, F8, Fz),
      Central_Frontal = chs_mean(FC1, FC2, FCz),
      Central = chs_mean(C3, C4, Cz),
      Central_Parietal = chs_mean(CP1, CP2, CPz),
      Temporal = chs_mean(T7, T8),
      Parietal = chs_mean(P3, P4, P7, P8, Pz),
      Parietal_Occipital = chs_mean(PO7, PO8),
      Occipital = chs_mean(O1, O2))
}





# funzione opposto di ''%in%''
# serve per selezionare gli elementi non inclusi in un certo insieme

'%ni%' <- Negate('%in%')







# funzione per sostituire il valore del potenziale in uno o più canali
# in una eeg_lst (anche con canali accorpati in aree)
# in input vuole:
#     - una eeg_list che contiene i dati usati per ottenere i t-values
#     - un vettore contenente i t-values, organizzati in una 
#         matrice (condizione x canale/area) se c'è più di una condizione
#     - un vettore contenente i nomi dei canali (o aree) relativi ai t-values
#         il vettore deve avere i nomi nello stesso ordine di quelli relativi ai t-values

replace_chan <- function(eeg_list, chan_names, chan_vals, area = FALSE){
  
  
  if(area == TRUE){
    
    eeg_list_area <- transmute_area(eeg_list)
    
    ctb <- channels_tbl(eeg_list) %>%
      mutate(.area = fct_collapse(factor(.channel),
                                  Frontal = c('Fp1', 'Fp2', 'F3', 'F4', 'F7', 'F8', 'Fz'),
                                  Central_Frontal = c('FC1', 'FC2', 'FCz'),
                                  Central = c('C3', 'C4', 'Cz'),
                                  Central_Parietal = c('CP1', 'CP2', 'CPz'),
                                  Temporal = c('T7', 'T8'),
                                  Parietal = c('P3', 'P4', 'P7', 'P8', 'Pz'),
                                  Parietal_Occipital = c('PO7', 'PO8'),
                                  Occipital = c('O1', 'O2'))) %>%
      dplyr::select(c(.area,.x,.y,.z)) %>%
      group_by(.area) %>%
      summarize_all(mean)  
    
    
    
    df1 <- eeg_list_area %>% ungroup()# %>%

    }
  
  else{
    

    df1 <- eeg_list %>% ungroup() %>%
      group_by(condition) %>%
      summarize_at(channel_names(.),mean) 
    
  }
  
  df2 <- df1
  
  
  cond <- is.vector(chan_vals)
  
  
  for(i in (1:ifelse(cond,length(chan_vals),NCOL(chan_vals)))){
    
    chan_nam_i <- as.character(chan_names[i])
    
    if(cond){
      
      df2$.signal[,chan_nam_i] <- channel_dbl(c(chan_vals[i],0))
    }
    
    else{
      
      df2$.signal[,chan_nam_i] <- channel_dbl(c(chan_vals[,i],0))
    }
    
    
  }
  
  
  df3 <- eeg_lst(
    signal_tbl = signal_tbl(df2),
    events_tbl = events_tbl(df1),
    segments_tbl = segments_tbl(df1) ,
    channels_tbl = channels_tbl(df1) 
  )
  
  
  if(area==TRUE){
    
   # ctb$.z[ctb$.area=='Occipital']  <- ctb$.z[ctb$.area=='Occipital'] + 10
    
    channels_tbl(df3)$.x <- ctb$.x
    channels_tbl(df3)$.y <- ctb$.y
    channels_tbl(df3)$.z <- ctb$.z
  }
  
  else{
    
    channels_tbl(df3) <- channels_tbl(df1)    
  }
  
  
  df3 %>% group_by(condition) %>% 
    summarize_at(channel_names(.),mean) %>%
    return()
  
}




























