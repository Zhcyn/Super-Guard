import UIKit
import SpriteKit
import GameplayKit
import AVFoundation
class GameViewController: UIViewController {
    var backingAudio = AVAudioPlayer()
    override func viewDidLoad() {
        super.viewDidLoad()
        let filePath = Bundle.main.path(forResource: "BossMain", ofType: "wav")
        let audioURL = URL(fileURLWithPath: filePath!)
        do {
            backingAudio = try AVAudioPlayer(contentsOf: audioURL)
        } catch {
            return print("Cannot find the audio")
        }
        backingAudio.numberOfLoops = -1 
        backingAudio.volume = 0.5
        backingAudio.play()
        let scene = GameScene(size: CGSize(width: 1536, height: 2048))
        let skView = self.view as! SKView
        skView.showsFPS = false
        skView.showsNodeCount = false
        skView.ignoresSiblingOrder = true;
        scene.scaleMode = .aspectFill
        skView.presentScene(scene)
    }
    override var shouldAutorotate: Bool {
        return true
    }
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
