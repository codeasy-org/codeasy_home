#!/bin/zsh
export MONGO_URL=mongodb://localhost:27777/codeasy_home
export MAIL_URL=smtps://meteorstartup:kwlgevradebyrszc@smtp.gmail.com:465
export ROOT_URL=https://codeasy.org
export MONTI_APP_ID=9t4Z2bjYgGruD2ACw 
export MONTI_APP_SECRET=fcad3747-3ca6-4570-bc98-bb76264b8165
export PORT=3102

#meteor -p3102
#meteor node .meteor/build/bundle/main.js --codeasy=codeasy_home
METEOR_NODE_PATH=$(meteor node -e "console.log(process.execPath);" 2>&1)
pm2 start .meteor/local/___build/bundle/main.js --name "codeasy.org" --interpreter "$METEOR_NODE_PATH"
