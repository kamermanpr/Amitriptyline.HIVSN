# Amitriptyline.HIVSN
Data from a clinical trial "To determine the effectiveness of amitriptyline compared to placebo in the management of moderate to severe HIV related peripheral neuropathy" (DOI 10.1186/ISRCTN54452526)

---
## Bibliographic information
Dinat N, Marinda E, Moch S, Rice AS, Kamerman PR. Randomized, Double-Blind,
Crossover Trial of Amitriptyline for Analgesia in Painful HIV-Associated Sensory 
Neuropathy. **PLoS One** *10*(5):e0126297.  
*DOI:*
[10.1371/journal.pone.0126297](http://journals.plos.org/plosone/article?id=10.1371/journal.pone.0126297)  
*PubMed PMID:* [25974287](http://www.ncbi.nlm.nih.gov/pubmed/25974287)  
GHAT
- - - 
All pain intensity data recorded on an 11-point numerical pain rating scale (0 = no pain, 10 = worst pain ever experienced)   
- - - 
## Data key  
### Demographics.csv (NA = missing data)
Basic demographic information on the cohort at baseline
* ID: Participant code
* Age: Age in years
* Female: Self-declared female sex
* CD4: Latest CD4 T-cell count (cells/mm^3)  
* ART: Antiretroviral use (any regimen)
* D4T_ever: Ever used stavudine
* D4T_now: Currently using stavudine
* D4T_previously: Not currently using stavudine
* Education_>9yrs: Nine years or greater of formal education	
* Employed: Any formal employment     

### Baseline.csv 
Baseline pain data
* ID: Participant code
* ARV: On antiretroviral therapy
* Period: First (week 1-6) or second (week 9-15) period of treatment 
* Treatment: P = Placebo, A = Amitriptyline
* Pain: Pain intensity rating     

### NNT.csv
Number needed to treat data
* ID: Participant code
* ARV: On antiretroviral therapy
* Period: First (week 1-6) or second (week 9-15) period of treatment 
* Treatment: P = Placebo, A = Amitriptyline
* Time1/Time2/Time3: Pain intensity rating on week 1, 3 and 6 of each treatment period
* PercentDelta: Percentage change in pain intensity between week 1 and 6   

### Dose.csv
Maximum dose of drug/placebo during each treatment period
* ID: Participant code
* ARV: On antiretroviral therapy
* Period: First (week 1-6) or second (week 9-15) period of treatment 
* Dose: Dose of amitriptyline or placebo (hypothetical dose based on number of placebo tables taken) (mg/day) 
* Tablets: Number of tablets of amitriptyline (25mg/tablet) or placebo taken per day   

### Pain change.csv
Change in pain between the start and end each six-week trial period
* ID: Participant code
* ARV: On antiretroviral therapy
* DeltaPlacebo: Change in pain intensity rating when taking placebo
* DeltaAmi: Change in pain intensity rating when taking amitriptyline
* DeltaP.A: Difference in between DeltaAmi and DeltaPlacebo (negative numbers indicate greater pain relief on placebo compared to amitriptyline)   

### Pain.csv
Pain intensity ratings on week 1,3,and 6 of each treatment period
* ID: Participant code
* ARV: On antiretroviral therapy
* Period: First (week 1-6) or second (week 9-15) period of treatment 
* Treatment: P = Placebo, A = Amitriptyline
* Week0/Week3/Week6: Pain intensity rating on week 1, 3 and 6 of each treatment period   

### Rescue meds.csv
Rescue medications taken when receiving placebo and amitriptyline
* ID: Participants code
* Placebo.taken: Rescue medication (any) taken when receiving placebo
* Placebo.para: Paracetamol taken when receiving placebo
* Placebo.nsaids: Non-steroidal anti-inflammatory drugs taken when receiving placebo
* Placebo.cod.para: Codeine and paracetamol combination taken when receiving placebo
* Placebo.caf.asa.para: Caffeine, aspirin and paracetamol taken when receiving placebo
* Ami.taken: Rescue medication (any) taken when receiving amitriptyline
* Ami.para: Paracetamol taken when receiving amitriptyline
* Ami.nsaids: Non-steroidal anti-inflammatory drugs taken when receiving amitriptyline
* Ami.cod.para: Codeine and paracetamol combination taken when receiving amitriptyline
* Ami.caf.asa.para: Caffeine, aspirin and paracetamol taken when receiving amitriptyline   

### Responder.analysis.csv
Demographic and phenotypic characteristics of responders and non-responders to amitriptyline treatment (>50% pain relief compared to when taking placebo)
* ID: Participant code
* Responder: Classed as a respnder or non-responder to amitriptyline treatment
* ARV: On antiretroviral therapy (any)
* Order: Order of treatment - PA = Placebo then Amitriptyline, AP = Amitriptyline then Placebo
* Age: Age in years
* Female: Self-declared female sex
* CD4: Latest CD4 T-cell count (cells/mm^3)  
* D4T_ever: Ever used stavudine
* D4T_now: Currently using stavudine
* D4T_previously: Not currently using stavudine
* Education_>9yrs: Nine years or greater of formal education	
* Employed: Any formal employment
* Burning: Pain reported as having burning quality
* Painful.cold: Pain reported as having cold quality
* Electric.shocks: Pain reported as have shock-like quality
* Tingling: Pain reported as having a tingling quality
* Pins.n.needles: Pain reported to feel like pins-and-needles
* Numbness: Pain associated with numbness
* Itching: Pain associated with itching sensation
* Touch.hypoesthesia: Reduced/absent touch sensation of light touch
* Pin.prick.hypoesthesia: Reduced/absent ability to distinguish sharp and blunt stimuli
* Brush.allodynia: Hypersensitivity to brushing the skin gently   

### Side effects.cv
Side effects reported when receiving amitriptyline or placebo
* ID: Participant code
* Placebo.DryMouth: Reported having a dry mouth when receiving placebo
* Placebo.Drowsy: Reported feeling drowsy when receiving placebo
* Placebo.ChestPain: Reported experiencing chest pain (nonspecific) when receiving placebo
* Ami.DryMouth: Reported having a dry mouth when receiving amitriptyline	
* Ami.Drowsy: Reported feeling drowsy when receiving amitriptyline	
* Ami.ChestPain: Reported experiencing chest pain (nonspecific) when receiving amitriptyline   

### xover.BOCF.csv & xover.PP.csv
Pain intensity data for the complete dataset (n = 124, baseline carried forward for participants with missing data), and the reduced dataset (n = 122, completed study per protocol)
* ID: Participant code
* ARV: On antiretroviral therapy
* Order: Order of treatment - PA = Placebo then Amitriptyline, AP = Amitriptyline then Placebo
* Period: First (week 1-6) or second (week 9-15) period of treatment 
* Treatment: P = Placebo, A = Amitriptyline
* Time1/Time2/Time3: Pain intensity rating on week 1, 3 and 6 of each treatment period

  
 


  
 
