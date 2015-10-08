var nThen = require("nthen");
var Fs = require("fs");

module.exports.check = function(builder, func, ldflags, callback) {

    var file = builder.tmpFile();
    var codeFile = file + '.c';
    var exeFile = file + builder.config.ext.exe;

    nThen(function(waitFor) {

        Fs.writeFile(codeFile, "int main() { " + func + "(); }", waitFor(function(err, ret) {
            if (err) {
                waitFor.abort();
                callback(err);
            }
        }));

    }).nThen(function(waitFor) {

        var flags = [];
        flags.push.apply(flags, ldflags);

        flags.push(builder.config.flag.outputExe + exeFile, codeFile);

        builder.cc(flags, waitFor(function(ret, out, err) {
            if (ret && /undefined reference/.test(err)) {
                callback(undefined, false);
            } else if (ret) {
                callback(new Error(err));
            } else {
                callback(undefined, true);
            }
        }));

    });
};
