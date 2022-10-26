traitdata: R package for easy access to various ecological trait data
================

## Installation

You can install traitdata from Github with:

``` r
# Install devtools if not available
if(!"remotes" %in% installed.packages()[,"Package"]) install.packages("remotes")

# Install traitdata package from Github
remotes::install_github("RS-eco/traitdata", build_vignettes = T, force=T)
```

After installation, simply load the `traitdata` package:

``` r
library(traitdata)
```

**If you encounter a bug or if you have any problems, please file an
[issue](https://github.com/RS-eco/traitdata/issues) on Github.**

## Data overview

There are 32 different data sets, which are included in this package:

| datasetName       | basisOfRecord  | rightsHolder              | DOI                                                                                                                      |
|-------------------|----------------|---------------------------|--------------------------------------------------------------------------------------------------------------------------|
| amniota           | traitDatabase  | Myrhvold et al. 2016      | [10.1890/15-0846R.1](http://doi.org/10.1890/15-0846R.1)                                                                  |
| amphi\_lifehist   | traitDatabase  | Trochet et al. 2014       | [10.3897/BDJ.2.e4123](http://doi.org/10.3897/BDJ.2.e4123)                                                                |
| amphibio          | traitDatabase  | Oliveira et al. 2017      | [10.1038/sdata.2017.123](http://doi.org/10.1038/sdata.2017.123)                                                          |
| an\_age           | traitDatabase  | Tacutu et al. 2018        | [10.1093/nar/gkx1042](http://doi.org/10.1093/nar/gkx1042)                                                                |
| anuran\_morpho    | traitDatabase  | Mendoza-Henao et al. 2019 | [10.1002/ecy.2685](http://doi.org/10.1002/ecy.2685)                                                                      |
| arthropods        | traitDatabase  | Gossner et al. 2015       | [10.1038/sdata.2015.13](http://doi.org/10.1038/sdata.2015.13)                                                            |
| atlantic\_birds   | traitDatabase  | Rodrigues et al. 2019     | [10.1002/ecy.2647](https://doi.org/10.1002/ecy.2647)                                                                     |
| australian\_birds | traitDatabase  | Garnett et al. 2015       | [10.1038/sdata.2015.61](https://doi.org/10.1038/sdata.2015.61)                                                           |
| AvianBodySize     | traitDatabase  | Lislevand et al. 2007     | [10.1890/06-2054](https://doi.org/10.1890/06-2054)                                                                       |
| bird\_behav       | traitDatabase  | Tobias & Pigot 2019       | [10.1098/rstb.2019.0012](http://dx.doi.org/10.1098/rstb.2019.0012)                                                       |
| carabids          | traitDatabase  | van der Plas et al. 2017  | [10.5061/dryad.53ds2](http://doi.org/10.5061/dryad.53ds2)                                                                |
| climber           | traitDatabase  | Schweiger et al. 2014     | [10.3897/zookeys.367.6185](http://doi.org/10.3897/zookeys.367.6185)                                                      |
| disperse          | traitDatabase  | Sarremejane et al. 2020   | [10.1038/s41597-020-00732-7](http://doi.org/10.1038/s41597-020-00732-7)                                                  |
| elton\_birds      | traitDatabase  | Wilman et al. 2014        | [10.1890/13-1917.1](http://doi.org/10.1890/13-1917.1)                                                                    |
| elton\_mammals    | traitDatabase  | Wilman et al. 2014        | [10.1890/13-1917.1](http://doi.org/10.1890/13-1917.1)                                                                    |
| epiphytes         | traitDatabase  | Hietz et al. 2021         | [10.1111/1365-2745.13802](https://doi.org/10.1111/1365-2745.13802)                                                       |
| eubirds           | traitDatabase  | Storchová & Hořák 2017    | [10.1111/geb.12709](https://doi.org/10.1111/geb.12709)                                                                   |
| fishmorph         | traitDatabase  | Brosse et al. 2021        | [10.1111/geb.13395](https://doi.org/10.1111/geb.13395)                                                                   |
| globalHWI         | traitDatabase  | Sheard et al. 2020        | [10.1038/s41467-020-16313-6](http://doi.org/10.1038/s41467-020-16313-6)                                                  |
| globTherm         | traitDatabase  | Bennett et al. 2018       | [10.1038/sdata.2018.22](https://doi.org/10.1038/sdata.2018.22)                                                           |
| heteroptera       | traitDatabase  | Gossner et al. 2016       | [10.6084/m9.figshare.c.3307611.v1](https://doi.org/10.6084/m9.figshare.c.3307611.v1)                                     |
| heteropteraRaw    | traitDatabase  | Gossner et al. 2016       | [10.6084/m9.figshare.c.3307611.v1](https://doi.org/10.6084/m9.figshare.c.3307611.v1)                                     |
| lizard\_traits    | traitDatabase  | Meiri 2018                | [10.1111/geb.12773](http://doi.org/10.1111/geb.12773)                                                                    |
| mammal\_diet      | traitDatabase  | Kissling et al. 2014      | [10.1002/ece3.1136](http://doi.org/10.1002/ece3.1136)                                                                    |
| mammal\_diet2     | traitDatabase  | Gainsbury et al. 2018     | [10.1111/mam.12119](http://doi.org/10.1111/mam.12119)                                                                    |
| marsupials        | traitDatabase  | Fisher et al. 2001        | [10.1890/0012-9658(2001)082\[3531:TEBOLH\]2.0.CO;2](https://doi.org/10.1890/0012-9658(2001)082%5B3531:TEBOLH%5D2.0.CO;2) |
| migbehav\_birds   | literatureData | Eyres & Fritz             | [10.12761/SGN.2017.10058](http://doi.org/10.12761/SGN.2017.10058)                                                        |
| pantheria         | traitDatabase  | Jones et al. 2009         | [10.1890/08-1494.1](http://doi.org/10.1890/08-1494.1)                                                                    |
| passerines        | traitDatabase  | Ricklefs 2017             | [10.1002/ecy.1783](http://doi.org/10.1002/ecy.1783)                                                                      |
| primates          | traitDatabase  | Galán-Acedo et al. 2020   | [10.1038/s41597-019-0059-9](http://doi.org/10.1038/s41597-019-0059-9)                                                    |
| reptile\_lifehist | traitDatabase  | Grimm et al. 2014         | [10.3897/natureconservation.9.8908](http://doi.org/10.3897/natureconservation.9.8908)                                    |
| tetra\_density    | traitDatabase  | Santini et al. 2018       | [10.1111/geb.12756](https://doi.org/10.1111/geb.12756)                                                                   |

**Note:** The code for how these datatsets were downloaded and processed
can be found in the
[data-raw](https://github.com/RS-eco/traitdata/tree/main/data-raw)
folder.

**See also <https://opentraits.org/datasets.html> for an extensive list
of Trait datasets.**

An overview of the different datasets can also be found here:
`vignette("data_info")`.

## Variables

-   All published datasets contain their original variables and species
    names. Species names were split into 2 columns (Genus and Species)
    and where applicable into a 3rd column with Subspecies names.
-   All datasets also have a scientificNameStd column, which is a
    standardised scientific name, in order to be able to merge the
    different datasets by species.

**Note:** Not all species names could be standardised, therefore some
data entries might not contain a scientificNameStd value, please then
refer to the Genus and Species column. In case you are interested in
which species could not be standardised have a look at the
`names_nonStd` file. Please also check out the `synonyms` data file, for
species where an alternative name has been used for standardising the
scientific name.

An overview of all variables with a description of each variable can be
found in the `trait_glossary` data file:

``` r
data(trait_glossary)
```

or in the `glossary` vignette:

``` r
vignette("trait_glossary")
```

## Data query

To connect to one or more datasets, we simply use the `data()` function.

``` r
# Load Elton Traits
data("elton_birds")
```

Now we can use standard R calls to have a look at the data.

First, we look at the column names of our dataset.

``` r
# Look at the variable names
colnames(elton_birds)
```

    ##  [1] "SpecID"                 "PassNonPass"            "Order"                 
    ##  [4] "Family"                 "BLFamilyEnglish"        "BLFamSequID"           
    ##  [7] "Taxo"                   "Genus"                  "Species"               
    ## [10] "English"                "Diet.Inv"               "Diet.Vend"             
    ## [13] "Diet.Vect"              "Diet.Vfish"             "Diet.Vunk"             
    ## [16] "Diet.Scav"              "Diet.Fruit"             "Diet.Nect"             
    ## [19] "Diet.Seed"              "Diet.PlantO"            "Diet.5Cat"             
    ## [22] "Diet.Source"            "Diet.Certainty"         "Diet.EnteredBy"        
    ## [25] "ForStrat.watbelowsurf"  "ForStrat.wataroundsurf" "ForStrat.ground"       
    ## [28] "ForStrat.understory"    "ForStrat.midhigh"       "ForStrat.canopy"       
    ## [31] "ForStrat.aerial"        "PelagicSpecialist"      "ForStrat.Source"       
    ## [34] "ForStrat.SpecLevel"     "ForStrat.EnteredBy"     "Nocturnal"             
    ## [37] "BodyMass.Value"         "BodyMass.Source"        "BodyMass.SpecLevel"    
    ## [40] "BodyMass.Comment"       "Record.Comment"         "Full.Reference"        
    ## [43] "scientificNameStd"

Then, we check the class and first 6 rows of the first 10 columns of the
`elton_traits` dataset:

``` r
class(elton_birds)
```

    ## [1] "data.frame"

``` r
head(elton_birds[,1:10])
```

    ##   SpecID      PassNonPass            Order        Family BLFamilyEnglish
    ## 1     28 Nonpasseriformes Struthioniformes Struthionidae       Ostriches
    ## 2     37 Nonpasseriformes       Rheiformes       Rheidae           Rheas
    ## 3     38 Nonpasseriformes       Rheiformes       Rheidae           Rheas
    ## 4     45 Nonpasseriformes   Casuariiformes   Casuariidae     Cassowaries
    ## 5     46 Nonpasseriformes   Casuariiformes   Casuariidae     Cassowaries
    ## 6     47 Nonpasseriformes   Casuariiformes   Casuariidae     Cassowaries
    ##   BLFamSequID Taxo     Genus          Species            English
    ## 1           2  BL3  Struthio          camelus            Ostrich
    ## 2           3  BL3      Rhea        americana       Greater Rhea
    ## 3           3  BL3      Rhea          pennata        Lesser Rhea
    ## 4           4  BL3 Casuarius        casuarius Southern Cassowary
    ## 5           4  BL3 Casuarius         bennetti    Dwarf Cassowary
    ## 6           4  BL3 Casuarius unappendiculatus Northern Cassowary

For more information on how to use the data within the package, check
out the `access-data` and all the other vignettes.

``` r
vignette("access-data")
```

Additional examples of how to use the different trait datasets can be
found in the following vignettes:

``` r
vignette("island-birds")
vignette("migbehav_birds")
vignette("morpho-indices")
vignette("pantheria")
vignette("passerines")
```
