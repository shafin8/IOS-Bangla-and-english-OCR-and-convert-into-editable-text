//
//  ViewController.swift
//  TextRec
//
//  Created by shafin haq on 26/2/18.
//  Copyright © 2018 shafin. All rights reserved.
//

import UIKit
import TesseractOCR

class ViewController: UIViewController , G8TesseractDelegate {
    @IBOutlet weak var imageView: UIImageView!

    @IBOutlet weak var textView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if let tesseract = G8Tesseract(language: "eng+ben") {
        
            tesseract.delegate = self
            tesseract.image = UIImage(named: "s")?.g8_blackAndWhite()
            tesseract.recognize()
            
            textView.text = tesseract.recognizedText
        
        }
      
        
    }
    
    func progressImageRecognition(for tesseract: G8Tesseract!) {
        print("Recognition progress \(tesseract.progress) % ")
    }

    @IBAction func chooseImage(_ sender: Any) {
        
        let actionSheet = UIAlertController(title: "Photo Source", message: "Choose a Source" , preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: {(action:UIAlertAction) in }))
        actionSheet.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: {(action:UIAlertAction) in }))
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        self.present(actionSheet, animated: true, completion: nil)
        
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

