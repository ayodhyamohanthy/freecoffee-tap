cask "freecoffee" do
  version "1.1.8"
  sha256 "9148a1bc6fb0057780efe21f3be6049c02b2e070922294daf729647a573b931a"

  url "https://github.com/ayodhyamohanthy/freecoffee-dist/releases/download/v#{version}/FreeCoffee.dmg"
  name "FreeCoffee"
  desc "Menu-bar ads that pay you back — FreeCoffee buys the coffee"
  homepage "https://freecoffee.tech/"

  livecheck do
    url :homepage
    strategy :github_latest do |json|
      json["tag_name"]&.sub(/^v/, "")
    end
  end

  app "FreeCoffee.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/FreeCoffee.app"]
  end

  caveats <<~EOS
    FreeCoffee is an unsigned demo build. The cask automatically removes the
    quarantine flag, so Gatekeeper never prompts. Earnings are simulated.
  EOS
end
