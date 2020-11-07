FROM erikvl87/languagetool

WORKDIR /home/languagetool
ENV WORKDIR=/home/languagetool

# Java heap size
ENV Java_Xms=512m
ENV Java_Xmx=1g

# LT Server configurations
ENV langtool_warmUp=true
ENV langtool_languageModel=/home/languagetool/ngrams
ENV langtool_word2vecModel=/home/languagetool/word2vec

# Copy ngrams & word2vec download script, and make it run in the background
# The goal is to prevent huge build times
COPY --chown=languagetool install_additionals.sh install_additionals.sh
RUN eval "${WORKDIR}/install_additionals" &>/dev/null & disown;

# Reset workdir to its default value
WORKDIR /LanguageTool
