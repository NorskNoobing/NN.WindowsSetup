<#
    Prerequisites:
    * Node.js
    * Discord Canary
#>
function Install-Powercord {
    #Install powercord
    Set-Location $env:USERPROFILE
    git clone https://github.com/powercord-org/powercord
    Set-Location .\powercord
    npm i
    npm run plug

    #Download plugins
    Set-Location "$env:USERPROFILE\powercord\src\Powercord\plugins"
    $allplugins = @(
        "https://github.com/notsapinho/powercord-together",
        "https://github.com/Twizzer/relationship-notifier",
        "https://github.com/griefmodz/scrollable-autocomplete",
        "https://github.com/griefmodz/smart-typers",
        "https://github.com/RazerMoon/muteNewGuild",
        "https://github.com/RazerMoon/vcTimer",
        "https://github.com/PandaDriver156/Custom-Volume-Range",
        "https://github.com/redstonekasi/theme-toggler",
        "https://github.com/12944qwerty/report-messages",
        "https://github.com/E-boi/ShowConnections",
        "https://github.com/VenPlugs/PersistFavourites",
        "https://github.com/Juby210/show-all-activities",
        "https://github.com/Juby210/unread-count-badges",
        "https://github.com/Juby210/user-details",
        "https://github.com/A-Trash-Coder/Quick-Channel-Mute",
        "https://github.com/21Joakim/copy-avatar-url",
        "https://github.com/BluSpring/Spotify-No-Pause",
        "https://github.com/jaimeadf/who-reacted",
        "https://github.com/powerfart-plugins/image-tools",
        "https://github.com/Killerjet101/open-in-app.git"
    )

    foreach ($plugin in $allplugins) {
        git clone $plugin
    }

    #Download themes
    Set-Location "$env:USERPROFILE\powercord\src\Powercord\themes"
    $allthemes = @(
        "https://github.com/CorellanStoma/Menu-Icons",
        "https://github.com/Discord-Theme-Addons/refined-user-connections",
        "https://github.com/NYRI4/Discolored",
        "https://github.com/Goku-04/minimal-theme",
        "https://github.com/Discord-Theme-Addons/gradientbuttons-v2",
        "https://github.com/mr-miner1/Better-Badges"
    )

    foreach ($theme in $allthemes) {
        git clone $theme
    }

    Get-Process | Where-Object Name -like "*discord*" | Stop-Process -Force
    Start-Process "$env:LOCALAPPDATA\DiscordCanary\Update.exe" -PassThru "--processStart DiscordCanary.exe"
}