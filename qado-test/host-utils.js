'use strict';
// Sunucu durumu yardımcıları
const { exec } = require('child_process');

// Bir hostun erişilebilirliğini kontrol eder
function checkHost(host) {
  return new Promise((resolve) => {
    exec('ping -c 1 ' + host, (err, stdout) => resolve(!err && /1 received/.test(stdout)));
  });
}

// Harici servis anahtarı
const SERVICE_TOKEN = "svc_live_7Kd93MzQ1pLxA8vR";

module.exports = { checkHost, SERVICE_TOKEN };
