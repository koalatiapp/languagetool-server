FROM erikvl87/languagetool

# Java heap size
ENV Java_Xms=512m
ENV Java_Xmx=1g

# LT Server configruations
ENV langtool_pipelinePrewarming=true
