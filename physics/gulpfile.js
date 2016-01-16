var gulp = require('gulp'),
    requireDir = require('require-dir');

var paths = ['./lib/*', './lib/**', './test/*'];

requireDir('./gulp_tasks', { recurse: true });

gulp.task('watch', ['test'], function () {
    return gulp.watch(paths, ['test']);
});

gulp.task('default', ['test']);
