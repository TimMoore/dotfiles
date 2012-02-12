ATLAS_OPTS+=" -Dfile.encoding=ISO-8859-1"
ATLAS_OPTS+=" -Djava.awt.headless=true"
ATLAS_OPTS+=" -XX:+UseCompressedOops"
export ATLAS_OPTS
export MAVEN_COLOR=true
export MAVEN_OPTS="${ATLAS_OPTS}"
