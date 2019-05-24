//
//  ViewController.swift
//  QRCode
//
//
//  ViewController.swift
//  Barcodeplay
//
//
//  An exercise file for iOS Development Tips Weekly
//  by Steven Lipton (C)2018, All rights reserved
//  For videos go to http://bit.ly/TipsLinkedInLearning
//  For code go to http://bit.ly/AppPieGithub
//
import UIKit
class ViewController:UIViewController{
    
    @IBOutlet var imageView: UIImageView!
    var qrcodeImage:CIImage! = nil
    
    
    func makeQrCode(text:String){
       qrcodeImage = nil
        if text.isEmpty {return}
        guard let filter = CIFilter(name: "CIQRCodeGenerator") else {return}
        guard let data = text.data(using: .isoLatin1, allowLossyConversion: false)
            else {return}
        filter.setValue(data, forKey: "inputMessage")
        filter.setValue("M", forKey: "inputCorrectionLevel")
        qrcodeImage = filter.outputImage
        if let qrcodeImage = qrcodeImage{
            imageView.image = UIImage(ciImage: qrcodeImage)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        imageView.backgroundColor = .green
        makeQrCode(text: "http://bit.ly/TipsLinkedInLearning")
    }
    
    
}
