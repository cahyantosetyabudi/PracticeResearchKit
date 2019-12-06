//
//  ViewController.swift
//  PracticeWithReasearchKit
//
//  Created by Cahyanto Setya Budi on 06/12/19.
//  Copyright © 2019 Cahyanto Setya Budi. All rights reserved.
//

import UIKit
import ResearchKit

public var MicrophoneTask: ORKOrderedTask {
    return ORKOrderedTask.audioTask(withIdentifier: "AudioTask", intendedUseDescription: "A sentence prompt will be given to you to read.", speechInstruction: "These are the last dying words of Joseph of Aramathea", shortSpeechInstruction: "The Holy Grail can be found in the Castle of Aaaaaaaaaaah", duration: 10, recordingSettings: nil, checkAudioLevel: false, options: .excludeAccelerometer)
}

class ViewController: UIViewController {

    @IBAction func btnShowVoice(_ sender: UIButton) {
        let taskVC = ORKTaskViewController(task: MicrophoneTask, taskRun: nil)
        taskVC.delegate = self
        taskVC.outputDirectory = URL(fileURLWithPath: NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first as! String, isDirectory: true)
        
        self.present(taskVC, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

extension ViewController: ORKTaskViewControllerDelegate {
    func taskViewController(_ taskViewController: ORKTaskViewController, didFinishWith reason: ORKTaskViewControllerFinishReason, error: Error?) {
        taskViewController.dismiss(animated: true, completion: nil)
    }
}
