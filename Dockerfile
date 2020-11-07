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
RUN mkdir /home/languagetool/ngrams && \
    wget https://languagetool.org/download/ngram-data/ngrams-en-20150817.zip && unzip ngrams-en-20150817.zip -d /home/languagetool/ngrams && rm ngrams-en-20150817.zip && \
    wget https://languagetool.org/download/ngram-data/ngrams-es-20150915.zip && unzip ngrams-es-20150915.zip -d /home/languagetool/ngrams && rm ngrams-es-20150915.zip && \
    wget https://languagetool.org/download/ngram-data/ngrams-fr-20150913.zip && unzip ngrams-fr-20150913.zip -d /home/languagetool/ngrams && rm ngrams-fr-20150913.zip && \
    wget https://languagetool.org/download/ngram-data/ngrams-nl-20181229.zip && unzip ngrams-nl-20181229.zip -d /home/languagetool/ngrams && rm ngrams-nl-20181229.zip && \
    wget https://languagetool.org/download/ngram-data/ngrams-de-20150819.zip && unzip ngrams-de-20150819.zip -d /home/languagetool/ngrams && rm ngrams-de-20150819.zip

# Download and ungzip word2vec neural network models
# More information available here: https://github.com/languagetool-org/languagetool/blob/master/languagetool-standalone/CHANGES.md#word2vec
RUN wget https://fscs.hhu.de/languagetool/word2vec.tar.gz && tar -xzf word2vec.tar.gz && mv word2vec /home/languagetool/word2vec && rm word2vec.tar.gz
