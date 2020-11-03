### Read data and perform basic data cleaning

library (readr)

urlfile="https://raw.githubusercontent.com/juliasilge/supervised-ML-case-studies-course/master/data/voters.csv"
# urlfile="https://raw.githubusercontent.com/lrjoshi/webpage/master/public/post/c159s.csv"
voter.df <- read_csv(url(urlfile))

str(voter.df)
dim(voter.df)


# turnout16_2016 is the response variable
# it's highly unbalanced
names(voter.df)[grepl("6_2016", names(voter.df))]
with(voter.df, table(turnout16_2016, useNA = 'ifany'))

# this will work only if appropriate libraries are loaded
voters %>%
  count(turnout16_2016)


