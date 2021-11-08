var is = require("electron-is");

// Mac and Linux have Bash shell scripts (so the following would work)
//        var child = process.spawn('child', ['-l']);
//        var child = process.spawn('./test.sh');       
// Win10 with WSL (Windows Subsystem for Linux)  https://docs.microsoft.com/en-us/windows/wsl/install-win10
//   
// Win10 with Git-Bash (windows Subsystem for Linux) https://git-scm.com/   https://git-for-windows.github.io/
//

function appendOutput(msg) { getCommandOutput().value += (msg + '\n'); };

function setStatus(msg) { getStatus().innerHTML = msg; };

function showOS() {
    if (is.windows())
        appendOutput("Windows Detected.")
    if (is.macOS())
        appendOutput("Apple OS Detected.")
    if (is.linux())
        appendOutput("Linux Detected.")
}

function backgroundProcess() {
    const process = require('child_process'); // The power of Node.JS
    showOS();
    var cmd = (is.windows()) ? 'Contents/Resources/app/src/quierollorar.bat' : './Contents/Resources/app/src/quierollorar.sh';
    if (is.macOS())
        cmd = './Contents/Resources/app/src/quierollorar_mac.sh'
    console.log('cmd:', cmd);

    var child = process.spawn(cmd, {
        cwd: '.',
        env: process.env
    });

    child.on('error', function(err) {
        appendOutput('error: <' + err + '>');
    });

    child.stdout.on('data', function(data) {
        appendOutput(data);
    });

    child.stderr.on('data', function(data) {
        appendOutput('stderr: <' + data + '>');
    });

    child.on('close', function(code) {
        if (code == 0)
            setStatus('MIT License - https://github.com/42Cyber/quierollorar');
        else
            setStatus('child process exited with code ' + code);

        getCommandOutput().style.background = "DarkGray";
    });
};

// End of GLUE