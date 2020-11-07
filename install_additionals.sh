#!/bin/bash
# Script that downloads and prepares additional resources for the LangaugeTool server to use
# This script is meant to be executed in the background, right after the container is built and started

# Download and unzip ngrams
# More information available here: https://dev.languagetool.org/finding-errors-using-n-gram-data
wget -P $WORKDIR/ https://languagetool.org/download/ngram-data/ngrams-en-20150817.zip && unzip $WORKDIR/ngrams-en-20150817.zip -d $WORKDIR/ngrams && rm $WORKDIR/ngrams-en-20150817.zip
wget -P $WORKDIR/ https://languagetool.org/download/ngram-data/ngrams-es-20150915.zip && unzip $WORKDIR/ngrams-es-20150915.zip -d $WORKDIR/ngrams && rm $WORKDIR/ngrams-es-20150915.zip
wget -P $WORKDIR/ https://languagetool.org/download/ngram-data/ngrams-fr-20150913.zip && unzip $WORKDIR/ngrams-fr-20150913.zip -d $WORKDIR/ngrams && rm $WORKDIR/ngrams-fr-20150913.zip
wget -P $WORKDIR/ https://languagetool.org/download/ngram-data/ngrams-nl-20181229.zip && unzip $WORKDIR/ngrams-nl-20181229.zip -d $WORKDIR/ngrams && rm $WORKDIR/ngrams-nl-20181229.zip
wget -P $WORKDIR/ https://languagetool.org/download/ngram-data/ngrams-de-20150819.zip && unzip $WORKDIR/ngrams-de-20150819.zip -d $WORKDIR/ngrams && rm $WORKDIR/ngrams-de-20150819.zip

# Download and ungzip word2vec neural network models
# More information available here: https://github.com/languagetool-org/languagetool/blob/master/languagetool-standalone/CHANGES.md#word2vec
wget -P $WORKDIR/ https://fscs.hhu.de/languagetool/word2vec.tar.gz && tar -xzf word2vec.tar.gz && rm $WORKDIR/word2vec.tar.gz
