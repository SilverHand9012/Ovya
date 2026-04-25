const https = require('https');
const fs = require('fs');

const families = ['Baloo+2', 'Baloo+Tamma+2', 'Baloo+Tammudu+2'];
const ua = 'Mozilla/5.0 (Linux; U; Android 4.1.1; en-gb; Build/KLP) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 Safari/534.30';

families.forEach(family => {
  const url = `https://fonts.googleapis.com/css?family=${family}:400,600,700`;
  https.get(url, { headers: { 'User-Agent': ua } }, (res) => {
    let data = '';
    res.on('data', chunk => data += chunk);
    res.on('end', () => {
      const match = data.match(/url\((http[^\)]+\.ttf)\)/);
      if (match) {
        const ttfUrl = match[1];
        const name = family.replace(/\+/g, '') + '-Regular.ttf';
        const file = fs.createWriteStream(`assets/fonts/${name}`);
        https.get(ttfUrl, (res2) => {
          res2.pipe(file);
          file.on('finish', () => {
            file.close();
            console.log(`Downloaded ${name}`);
          });
        });
      } else {
        console.log(`Failed to find TTF for ${family}`);
      }
    });
  });
});
