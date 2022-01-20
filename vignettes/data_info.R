## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")

## ---- results="asis", echo=F--------------------------------------------------
table <- "
amniota | traitDatabase | Myrhvold et al. 2016 | [10.1890/15-0846R.1](http://doi.org/10.1890/15-0846R.1)
amphi_lifehist | traitDatabase | Trochet et al. 2014 | [10.3897/BDJ.2.e4123](http://doi.org/10.3897/BDJ.2.e4123)
amphibio | traitDatabase | Oliveira et al. 2017 | [10.1038/sdata.2017.123](http://doi.org/10.1038/sdata.2017.123)
an_age | traitDatabase | Tacutu et al. 2018 | [10.1093/nar/gkx1042](http://doi.org/10.1093/nar/gkx1042)
anuran_morpho | traitDatabase | Mendoza-Henao et al. 2019 | [10.1002/ecy.2685](http://doi.org/10.1002/ecy.2685)
arthropods | traitDatabase | Gossner et al. 2015 | [10.1038/sdata.2015.13](http://doi.org/10.1038/sdata.2015.13)
atlantic_birds | traitDatabase | Rodrigues et al. 2019 | [10.1002/ecy.2647](https://doi.org/10.1002/ecy.2647)
australian_birds | traitDatabase | Garnett et al. 2015 | [10.1038/sdata.2015.61](https://doi.org/10.1038/sdata.2015.61)
AvianBodySize | traitDatabase | Lislevand et al. 2007 | [10.1890/06-2054](https://doi.org/10.1890/06-2054)
bird_behav | traitDatabase | Tobias & Pigot 2019 | [10.1098/rstb.2019.0012](http://dx.doi.org/10.1098/rstb.2019.0012)
carabids | traitDatabase | van der Plas et al. 2017 | [10.5061/dryad.53ds2](http://doi.org/10.5061/dryad.53ds2)
climber | traitDatabase | Schweiger et al. 2014 | [10.3897/zookeys.367.6185](http://doi.org/10.3897/zookeys.367.6185)
disperse | traitDatabase | Sarremejane et al. 2020 | [10.1038/s41597-020-00732-7](http://doi.org/10.1038/s41597-020-00732-7)
elton_birds	| traitDatabase	| Wilman et al. 2014 | [10.1890/13-1917.1](http://doi.org/10.1890/13-1917.1)
elton_mammals |	 traitDatabase	| Wilman et al. 2014 | [10.1890/13-1917.1](http://doi.org/10.1890/13-1917.1)
epiphytes | traitDatabase | Hietz et al. 2021 | [10.1111/1365-2745.13802](https://doi.org/10.1111/1365-2745.13802)
eubirds | traitDatabase | Storchová & Hořák 2017 | [10.1111/geb.12709](https://doi.org/10.1111/geb.12709)
fishmorph | traitDatabase | Brosse et al. 2021 | [10.1111/geb.13395](https://doi.org/10.1111/geb.13395)
globalHWI | traitDatabase | Sheard et al. 2020 | [10.1038/s41467-020-16313-6](http://doi.org/10.1038/s41467-020-16313-6)
globTherm | traitDatabase | Bennett et al. 2018 | [10.1038/sdata.2018.22](https://doi.org/10.1038/sdata.2018.22)
heteroptera | traitDatabase | Gossner et al. 2016 | [10.6084/m9.figshare.c.3307611.v1](https://doi.org/10.6084/m9.figshare.c.3307611.v1)
heteropteraRaw | traitDatabase | Gossner et al. 2016 | [10.6084/m9.figshare.c.3307611.v1](https://doi.org/10.6084/m9.figshare.c.3307611.v1)
lizard_traits | traitDatabase | Meiri 2018 | [10.1111/geb.12773](http://doi.org/10.1111/geb.12773)
mammal_diet | traitDatabase | Kissling et al. 2014 | [10.1002/ece3.1136](http://doi.org/10.1002/ece3.1136)
mammal_diet2 | traitDatabase | Gainsbury et al. 2018 | [10.1111/mam.12119](http://doi.org/10.1111/mam.12119)
marsupials | traitDatabase | Fisher et al. 2001 | [10.1890/0012-9658(2001)082[3531:TEBOLH]2.0.CO;2](https://doi.org/10.1890/0012-9658(2001)082[3531:TEBOLH]2.0.CO;2)
migbehav_birds	| literatureData	| Eyres & Fritz	| [10.12761/SGN.2017.10058](http://doi.org/10.12761/SGN.2017.10058)
pantheria | traitDatabase | Jones et al. 2009 | [10.1890/08-1494.1](http://doi.org/10.1890/08-1494.1)
passerines | traitDatabase | Ricklefs 2017 | [10.1002/ecy.1783](http://doi.org/10.1002/ecy.1783)
primates | traitDatabase | Galán-Acedo et al. 2020 | [10.1038/s41597-019-0059-9](http://doi.org/10.1038/s41597-019-0059-9)
reptile_lifehist | traitDatabase | Grimm et al. 2014 | [10.3897/natureconservation.9.8908](http://doi.org/10.3897/natureconservation.9.8908)
tetra_density | traitDatabase | Santini et al. 2018 | [10.1111/geb.12756](https://doi.org/10.1111/geb.12756)
"
df <- read.delim(textConnection(table),header=FALSE,sep="|",strip.white=TRUE,stringsAsFactors=FALSE)
names(df) <- unname(as.list(df[1,])) # put headers on
df <- df[-1,] # remove first row
row.names(df)<-NULL
knitr::kable(df, style="rmarkdown")

