# Functions, etc to make dev over SSH easier


cli() { _egg=`ls /usr/local/lib/python2.7/site-packages |grep mycroft_core` ; python /usr/local/lib/python2.7/site-packages/$_egg/mycroft/client/text/main.py --quiet ; }
reload() { sudo touch /opt/mycroft/skills/$1/tmp.pyc ; sudo rm /opt/mycroft/skills/$1/*.pyc ; echo $1' reloading...' ; }
skills-log() { cat /var/log/mycroft-skills.log |grep $1 -B $2 -A $3 |less ; }
core-version() { python -c "import mycroft.version; print mycroft.version.CORE_VERSION_STR" ; }
mkcdir() { mkdir $1 && cd $1 ; }
fix-perms() { sudo chown mycroft $1 ; sudo chgrp mycroft $1 ; sudo chmod o+w $1 ; }
restart-skills-service() { sudo service mycroft-skills restart ; echo "Skills service restarted..." ; }

export SKILLS_DIR="/opt/mycroft/skills"
export PY_DIR="/usr/local/lib/python2.7"
export MCBSS_DIR=$PY_DIR"/site-packages/mycroftbss"
