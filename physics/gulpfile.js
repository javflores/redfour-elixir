var gulp = require('gulp'),
    exec = require('gulp-exec'),
    options = {
        continueOnError: false,
        pipeStdout: false
    },
    reportOptions = {
        err: false,
        stderr: false,
        stdout: true
    };

gulp.task('test', function() {
    return gulp.src('')
        .pipe(exec('mix test', options))
        .on('error', function(err){
            console.error('**** MIX TEST FAILED ****');
        })
        .pipe(exec.reporter(reportOptions));
});