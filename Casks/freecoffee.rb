cask "freecoffee" do
  version "1.1.6"
  sha256 "a1ca92924378b1843df9ef169d5be341f336c7b25b3cd42bab7b64961a9dacf5"

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
