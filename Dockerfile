FROM erikvl87/languagetool

# Java heap size
ENV Java_Xms=512m
ENV Java_Xmx=1g

# LT Server configurations
ENV langtool_warmUp=true
ENV langtool_languageModel=/ngrams
ENV langtool_word2vecModel=/word2vec

# Download and unzip ngrams
# More information available here: https://dev.languagetool.org/finding-errors-using-n-gram-data
RUN mkdir /ngrams
RUN wget https://languagetool.org/download/ngram-data/ngrams-en-20150817.zip && unzip ngrams-en-20150817.zip -d /ngrams && rm ngrams-en-20150817.zip
RUN wget https://languagetool.org/download/ngram-data/ngrams-es-20150915.zip && unzip ngrams-es-20150915.zip -d /ngrams && rm ngrams-es-20150915.zip
RUN wget https://languagetool.org/download/ngram-data/ngrams-fr-20150913.zip && unzip ngrams-fr-20150913.zip -d /ngrams && rm ngrams-fr-20150913.zip
RUN wget https://languagetool.org/download/ngram-data/ngrams-nl-20181229.zip && unzip ngrams-nl-20181229.zip -d /ngrams && rm ngrams-nl-20181229.zip
RUN wget https://languagetool.org/download/ngram-data/ngrams-de-20150819.zip && unzip ngrams-de-20150819.zip -d /ngrams && rm ngrams-de-20150819.zip

# Download and ungzip word2vec neural network models
# More information available here: https://github.com/languagetool-org/languagetool/blob/master/languagetool-standalone/CHANGES.md#word2vec
RUN wget https://fscs.hhu.de/languagetool/word2vec.tar.gz && tar -xzf word2vec.tar.gz && mv word2vec /word2vec && rm word2vec.tar.gz
