rm -rf .meteor/local/___build/*
meteor build .meteor/local/___build
cd .meteor/local/___build
tar zxvf *.tar.gz
cd bundle/programs/server
meteor npm install --production
