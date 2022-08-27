alias start-entouch-core="cd ~/github/dinacare/entouch-core && nvm use && cd packages/entouch-rest && yarn start:local"
alias start-enTouch-web="cd ~/github/dinacare/enTouch-web && nvm use && npm run start:local"
alias start-hub="cd ~/github/dinacare/hub && nvm use && npm run start-web-local"
alias start-enTouch-mobile="cd ~/github/dinacare/enTouch-mobile && nvm use && gulp clean && gulp serve --env=master"

export FIREBASE_CONFIG=$(cat ~/github/dinacare/entouch-core/packages/entouch-legacy-services/src/gcp/enTouch-master.json)

