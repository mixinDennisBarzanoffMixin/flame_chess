import Cocoa
import FlutterMacOS

class MainFlutterWindow: NSWindow {
  override func awakeFromNib() {
    let flutterViewController = FlutterViewController()
    let windowFrame = self.frame
    self.contentViewController = flutterViewController
    self.setFrame(windowFrame, display: true)

    // Setze die Fenstergröße auf 800x800
    self.setContentSize(NSSize(width: 800, height: 800))
    // Setze minimale Fenstergröße
    self.minSize = NSSize(width: 400, height: 400)
    // Setze maximale Fenstergröße
    self.maxSize = NSSize(width: 1200, height: 1200)

    RegisterGeneratedPlugins(registry: flutterViewController)

    super.awakeFromNib()
  }
}
