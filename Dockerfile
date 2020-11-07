FROM erikvl87/languagetool

WORKDIR /home/languagetool

# Java heap size
ENV Java_Xms=512m
ENV Java_Xmx=1g

# LT Server configurations
ENV langtool_warmUp=true
ENV langtool_languageModel=/home/languagetool/ngrams
ENV langtool_word2vecModel=/home/languagetool/word2vec

# Download and unzip ngrams
# More information available here: https://dev.languagetool.org/finding-errors-using-n-gram-data
