const fs = require('fs');
const path = require('path');

function replaceInDir(dir) {
    const files = fs.readdirSync(dir);
    for (const file of files) {
        const filePath = path.join(dir, file);
        const stat = fs.statSync(filePath);
        if (stat.isDirectory()) {
            replaceInDir(filePath);
        } else if (file.endsWith('.dart')) {
            let content = fs.readFileSync(filePath, 'utf8');
            if (content.includes('withOpacity(')) {
                // Regex to match .withOpacity(value) and replace with .withValues(alpha: value)
                // This is a simple regex, it might need refinement for complex cases
                const newContent = content.replace(/\.withOpacity\(([^)]+)\)/g, '.withValues(alpha: $1)');
                if (newContent !== content) {
                    fs.writeFileSync(filePath, newContent);
                    console.log(`Updated ${filePath}`);
                }
            }
        }
    }
}

replaceInDir('lib');
