//
//  ViewController.swift
//  OCR
//
//  Created by 김혜리 on 2020/04/06.
//  Copyright © 2020 OneParkThreeKim. All rights reserved.
//

import UIKit
import TesseractOCR

enum Language {
    case Kor
    case Eng
    
    func stringValue() -> String {
        switch self {
        case .Kor:
            return "kor"
        case .Eng:
            return "eng"
        }
    }
}

class ViewController: UIViewController, G8TesseractDelegate {

    @IBOutlet weak var textView: UITextView!
    var language: Language = .Kor
    var image: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        if let tesseract = G8Tesseract(language: language.stringValue()) {
            tesseract.delegate = self
            tesseract.image = image?.g8_blackAndWhite()
            tesseract.recognize()
            
            textView.text = tesseract.recognizedText
        }
        
    }

    func progressImageRecognition(for tesseract: G8Tesseract!) {
        print("Recongnition Progress \(tesseract.progress) %")
    }
}

