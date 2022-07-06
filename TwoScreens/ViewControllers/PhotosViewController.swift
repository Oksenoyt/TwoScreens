//
//  PhotosViewController.swift
//  TwoScreens
//
//  Created by Arseniy Oksenoyt on 06.07.2022.
//

import UIKit

class PhotosViewController: UIViewController {
    
    @IBOutlet var photoImageView: UIImageView!
    
    var userPhoto: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        photoImageView.image = userPhoto
    }
}
