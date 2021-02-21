alias qtcreator="/home/ganesh/sft/Qt/Tools/QtCreator/bin/qtcreator.sh &"
alias qt3studio="/home/ganesh/sft/Qt/Tools/Qt3DStudio/bin/Qt3DStudio &"
alias qt3dviewer="/home/ganesh/sft/Qt/Tools/Qt3DStudio/bin/Qt3DViewer &"
alias qtdesignstudio="/home/ganesh/sft/Qt/Tools/QtDesignStudio/bin/qtdesignstudio &"

alias obsidian="/home/ganesh/sft/Obsidian/Obsidian-0.10.1.AppImage &"

alias screenrpi="screen -L -Logfile /home/ganesh/vmshare/logging/rpi/rpi_serial_$(date +%Y%m%d%k%M).log  /dev/ttyUSB0 115200"

#set environments
alias setenvaglrpi3="source meta-agl/scripts/aglsetup.sh -m raspberrypi3 -b raspberrypi3 agl-demo agl-devel"

#repo shortcuts
alias repo_reset='repo forall -c "git reset --hard"; repo forall -c "git clean -fdx"; repo sync -j$(nproc) -dl --force-sync --force-remove-dirty --prune;'
