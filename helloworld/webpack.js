const path = require('path')
const webpackConfig = require('@nextcloud/webpack-vue-config')

webpackConfig.entry = {
	"files-action": { import: path.join(__dirname, 'src', 'files-action.js'), filename: 'files-action.js' },
}

module.exports = webpackConfig
