curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.7/install.sh | bash
source ~/.nvm/nvm.sh
nvm install 8
npm install -g pm2
pm2 install pm2-logrotate
npm init --yes
npm install --save coin-hive-stratum
cat >./proxy.js <<FILE
const Proxy = require("coin-hive-stratum");
const proxy = new Proxy({
  host: "cryptonight.eu.nicehash.com",
  port: 3355
});
proxy.listen(80);
FILE
cat >./proxy_secure.js <<FILE
const Proxy = require("coin-hive-stratum");
const domain = "0.0.0.0"
const proxy = new Proxy({
  host: "cryptonight.eu.nicehash.com",
  port: 3355,
  key: require("fs").readFileSync("/etc/letsencrypt/live/" + domain + "/privkey.pem"),
  cert: require("fs").readFileSync("/etc/letsencrypt/live/" + domain + "/fullchain.pem"),
});
proxy.listen(443);
FILE