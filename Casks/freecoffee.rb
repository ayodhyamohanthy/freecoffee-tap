cask "freecoffee" do
  version "1.1.0"
  sha256 "4d67562bb2632e025af8235adccb0d344351708317f9e91089c0e21f25bfccce"

  url "https://github.com/ayodhyamohanthy/freecoffee/releases/download/v#{version}/FreeCoffee.dmg"
  name "FreeCoffee"
  desc "Menu-bar ads that pay you back — FreeCoffee buys the coffee"
  homepage "https://ayodhyamohanthy.github.io/freecoffee/"

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
