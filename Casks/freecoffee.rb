cask "freecoffee" do
  version "1.1.0"
  sha256 "9fe1550c008ef7e3151cf139296c959dea115a372c26af9a81ed5d329f0dd0d1"

  url "https://github.com/ayodhyamohanthy/freecoffee/releases/download/v#{version}/FreeCoffee.dmg"
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
    FreeCoffee is an unsigned open-source demo build (single-file Swift,
    auditable in the public repo). The cask automatically removes the
    quarantine flag, so Gatekeeper never prompts. Earnings are simulated.
  EOS
end
