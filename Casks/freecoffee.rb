cask "freecoffee" do
  version "1.1.2"
  sha256 "777d63ae8a3eee6f99af6b3f970d6c405e6d963fc7ad64aef69c3e3b6e6c5d8b"

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
