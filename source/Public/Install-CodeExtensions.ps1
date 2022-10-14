function Install-CodeExtensions {
    try {
        code --version
    }
    catch [System.Management.Automation.CommandNotFoundException] {
        throw "Please run `"Install-VSCode`" before running this command."
    }

    $CodeExtensions = @(
        "bagetx.inf",
        "bungcip.better-toml",
        "eamodio.gitlens",
        "formulahendry.auto-close-tag",
        "formulahendry.auto-rename-tag",
        "GEEKiDoS.vdf",
        "GitHub.remotehub",
        "IronGeek.vscode-env",
        "leighlondon.eml",
        "ms-azuretools.vscode-docker",
        "ms-python.python",
        "ms-python.vscode-pylance",
        "ms-toolsai.jupyter",
        "ms-toolsai.jupyter-keymap",
        "ms-toolsai.jupyter-renderers",
        "ms-vscode-remote.remote-containers",
        "ms-vscode-remote.remote-ssh",
        "ms-vscode-remote.remote-ssh-edit",
        "ms-vscode.powershell",
        "PKief.material-icon-theme",
        "ritwickdey.LiveServer",
        "royaction.color-manager",
        "WallabyJs.quokka-vscode",
        "wayou.vscode-todo-highlight",
        "xcad2k.vscode-thedigitallife",
        "icrawl.discord-vscode"
    )
    
    foreach ($item in $CodeExtensions) {
        code --install-extension $item
    }
}
