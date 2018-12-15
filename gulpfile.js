const { series, parallel, watch, src, dest } = require('gulp');
const fileinclude = require('gulp-file-include');
const less = require('gulp-less');
const browserSync = require('browser-sync').create();

function include() {
	return src('HTML2/src/*.html')
		.pipe(fileinclude({
			prefix: '@@',
			basepath: '@file'
		}))
		.pipe(dest('HTML2'));
}

function lessCompile() {
	return src('HTML2/less/*.less')
		.pipe(less().on('error', function(err) {
			console.error(err.toString());
			this.emit('end');
		}))
		.pipe(dest('HTML2/css'));
}

function monitor(done){
	browserSync.init({
		server: {
			baseDir: './'
		},
		port: 3000,
		browser: "chrome",
		cors: true
	});
	done()
}

function reload(done) {
	browserSync.reload()
	done()
}

watch('HTML2/src/*.html', series(include, reload))
watch('HTML2/src/partials/*.html', series(include, reload))
watch('HTML2/less/*.less', series(lessCompile, reload))
watch('HTML2/js/*.js', reload)

exports.default = series(
	include,
	lessCompile,
	monitor
);