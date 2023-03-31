import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController, AVPlayerViewControllerDelegate {
    
    let timeService = TimeServiceManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timeService.delegate = self as? TimeServiceManagerDelegate
    }
    
    var timer: DispatchSourceTimer?
   

    func playerViewControllerWillBeginDismissalTransition(_ playerViewController: AVPlayerViewController) {
//        print(#function)   mostra la funzione richiamata nella console
        timer?.cancel()
        timer = nil
    }

    func aggiornaTempo(){
        timeService.send(Time: String(video.currentTime().seconds))
    }
    
    var video = AVPlayer()
    
    @IBAction func guardafilm(_ sender: Any) {
        if let path = Bundle.main.path(forResource: "10MIN - Sciarada", ofType: "mp4"){
            self.video = AVPlayer(url: URL(fileURLWithPath: path))
            let videoPlayer = AVPlayerViewController()
            videoPlayer.player = self.video
            videoPlayer.delegate = self
            
            timer = DispatchSource.makeTimerSource(flags: [], queue: DispatchQueue.main)
            
            present(videoPlayer,animated: true, completion: {
            self.video.play()} )
            
            timer?.schedule(deadline: DispatchTime.now(), repeating: DispatchTimeInterval.seconds(Int(1)), leeway: .milliseconds(5))
            timer?.setEventHandler(qos: .userInitiated, flags: [], handler: aggiornaTempo)
            timer?.resume()
            }
        }
    

    
    @IBAction func guardaFilm2(_ sender: Any) {
        
        if let path = Bundle.main.path(forResource: "10MIN La notte dei morti viventi", ofType: "mp4"){
            self.video = AVPlayer(url: URL(fileURLWithPath: path))
            let videoPlayer = AVPlayerViewController()
            videoPlayer.player = self.video
            videoPlayer.delegate = self
            
            timer = DispatchSource.makeTimerSource(flags: [], queue: DispatchQueue.main)

            present(videoPlayer,animated: true, completion: {
                self.video.play()} )
            
            timer?.schedule(deadline: DispatchTime.now(), repeating: DispatchTimeInterval.seconds(Int(1)), leeway: .milliseconds(5))
            timer?.setEventHandler(qos: .userInitiated, flags: [], handler: aggiornaTempo)
            timer?.resume()
        }
    }


    @IBAction func guardaFilm3(_ sender: Any) {
    
        if let path = Bundle.main.path(forResource: "10MIN La piccola bottega degli orrori", ofType: "mp4"){
            self.video = AVPlayer(url: URL(fileURLWithPath: path))
            let videoPlayer = AVPlayerViewController()
            videoPlayer.player = self.video
            videoPlayer.delegate = self
            
            timer = DispatchSource.makeTimerSource(flags: [], queue: DispatchQueue.main)

            present(videoPlayer,animated: true, completion: {
                self.video.play()} )
            
            timer?.schedule(deadline: DispatchTime.now(), repeating: DispatchTimeInterval.seconds(Int(1)), leeway: .milliseconds(5))
            timer?.setEventHandler(qos: .userInitiated, flags: [], handler: aggiornaTempo)
            timer?.resume()
        }
    }
}
