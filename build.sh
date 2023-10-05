rm -rf .meteor/build/*
meteor build .meteor/build
cd .meteor/build
tar zxvf *.tar.gz
cd bundle/programs/server
meteor npm install --production
