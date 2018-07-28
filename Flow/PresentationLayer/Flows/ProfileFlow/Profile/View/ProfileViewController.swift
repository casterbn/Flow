//
//  ProfileViewController.swift
//  Flow
//
//  Created by Beslan Tularov on 27/07/2018.
//  Copyright © 2018 Flow. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, ProfileViewInput {

	// MARK: - Properties

    var output: ProfileViewOutput!
	
	// MARK: - IBOutlets

	@IBOutlet weak var photo: UIImageView!
	@IBOutlet weak var field: UITextField!
	@IBOutlet weak var button: UIButton!
	@IBOutlet var labels: [UILabel]!

    // MARK: - Life cycle
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
        output.viewIsReady()
		photoAppearance()
		fieldAppearance()
		labelsAppearance()
		buttonAppearance()
    }


    // MARK: - ProfileViewInput
	
    func setupInitialState() {
    }
	
	// MARK: - Appearance
	
	private func photoAppearance() {
		
		photo.image = #imageLiteral(resourceName: "photo")
		photo.contentMode = .center
		photo.backgroundColor = AppAppearance.UI.Image.color
		photo.layer.cornerRadius = photo.frame.width / 2
		photo.layer.masksToBounds = true
	}
	
	private func fieldAppearance() {
		
		field.backgroundColor = AppAppearance.UI.Filed.color
		field.layer.cornerRadius = AppAppearance.UI.Filed.radius
		field.layer.masksToBounds = true
		field.textAlignment = .center
		field.isEnabled = false
	}
	
	private func labelsAppearance() {
		
		labels.forEach { (label) in
			
			label.backgroundColor = AppAppearance.UI.Label(tag: label.tag).color
			label.layer.cornerRadius = AppAppearance.UI.Label(tag: label.tag).radius
			label.layer.masksToBounds = true
			label.textAlignment = .left
		}
	}
	
	private func buttonAppearance() {
		
		button.layer.cornerRadius = AppAppearance.UI.Button(tag: button.tag).radius
		button.layer.masksToBounds = true
		button.setTitleColor(.white, for: .normal)
		button.backgroundColor = AppAppearance.UI.Button(tag: button.tag).color
		button.setTitle("Exit", for: .normal)
	}
	
	// MARK: - Actions
	
	@IBAction func singIn(_ sender: UIButton) {
		
		let storyboard = UIStoryboard(name: "AuthorizationFlow", bundle: nil)
		let vc = storyboard.instantiateViewController(withIdentifier: String(describing: SingInViewController.self))
		present(vc, animated: true, completion: nil)
	}
}
