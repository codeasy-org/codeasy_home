export MONGO_URL=mongodb://localhost:27777/codeasy_home
export MAIL_URL=smtps://meteorstartup:kwlgevradebyrszc@smtp.gmail.com:465
export ROOT_URL=https://meteor.or.kr
export PORT=3106

#meteor -p3102
#meteor node .meteor/build/bundle/main.js --codeasy=codeasy_home
METEOR_NODE_PATH=$(meteor node -e "console.log(process.execPath);" 2>&1)
pm2 start .meteor/local/___build/bundle/main.js --name "meteor.or.kr" --interpreter "$METEOR_NODE_PATH"
