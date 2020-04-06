//
//  InitViewController.swift
//  OCR
//
//  Created by 김혜리 on 2020/04/06.
//  Copyright © 2020 OneParkThreeKim. All rights reserved.
//

import UIKit

class InitViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    private var imagePicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func userTappedImage(_ sender: UITapGestureRecognizer) {
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .camera
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imagePicker.dismiss(animated: true, completion: nil)
        imageView.image = info[.originalImage] as? UIImage
    }
    
    @IBAction func transformButtonClicked(_ sender: UIButton) {
        guard let vc = self.storyboard?.instantiateViewController(identifier: "ViewController") as? ViewController else { return }
        vc.image = self.imageView.image
        if segmentedControl.selectedSegmentIndex == 0 {
            vc.language = .Kor
        } else {
            vc.language = .Eng
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
