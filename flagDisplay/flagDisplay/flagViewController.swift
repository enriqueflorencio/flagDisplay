//
//  flagViewController.swift
//  flagDisplay
//
//  Created by Enrique Florencio on 6/3/19.
//  Copyright © 2019 Enrique Florencio. All rights reserved.
//

import UIKit

class flagViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    var imageName : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = imageName
        navigationItem.largeTitleDisplayMode = .never
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        
        if let imageToLoad = imageName {
            imageView.image = UIImage(named: imageToLoad)
        }
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    @objc func shareTapped() {
        guard let image = imageView.image?.jpegData(compressionQuality: 0.8) else {
            print("Image not found")
            return
        }
        
        let vc = UIActivityViewController(activityItems: [image, imageName], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }
    

    

}
