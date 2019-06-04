//
//  ViewController.swift
//  DemoConstraintProgramically
//
//  Created by ly.hoang.quang on 6/3/19.
//  Copyright © 2019 ly.hoang.quang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let avatarView = UIView()
    let avatarImage = UIImageView()
    let stackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        constraintAvatarView()
        constraintAvatarImage()
        addLabels()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        avatarView.layer.cornerRadius = avatarView.bounds.size.width / 2
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        avatarImage.layer.cornerRadius = avatarImage.bounds.size.width / 2
    }
    
    // Constraint functions
    func constraintAvatarView() {
        avatarView.backgroundColor = .orange
        avatarView.clipsToBounds = true
        view.addSubview(avatarView)
        
        let centerXContraint = AutoLayoutHelper.equalConstraint(avatarView, superView: view, attribute: .centerX)
        let ratioConstraint = AutoLayoutHelper.ratioConstraint(avatarView, multiplier: 1)
        let topConstraint  = AutoLayoutHelper.equalConstraint(avatarView, superView: view, attribute: .topMargin, constant: 50)
        AutoLayoutHelper.sameWidth(avatarView, superView: view, multiplier: 1/3)
        view.addConstraints([centerXContraint, ratioConstraint, topConstraint])
    }
    
    func constraintAvatarImage() {
        avatarImage.image = UIImage(named: "avatar_img")
        avatarImage.clipsToBounds = true
        avatarImage.contentMode = .scaleAspectFill
        avatarView.addSubview(avatarImage)
        
        AutoLayoutHelper.center(avatarImage, superView: avatarView)
        let topConstraint = AutoLayoutHelper.equalConstraint(avatarImage, superView: avatarView, attribute: .top, constant: 5)
        let leftConstraint = AutoLayoutHelper.equalConstraint(avatarImage, superView: avatarView, attribute: .left, constant: 5)
        avatarView.addConstraints([topConstraint, leftConstraint])
    }
    
    func addLabels() {
        let nameLabel = UILabel()
        nameLabel.text = "Fullname: Jessica Alba"
        let birthdayLabel = UILabel()
        birthdayLabel.text = "Birthday: 19/5/2000"
        let jobLabel = UILabel()
        jobLabel.text = "Job: Actress/Singer"
        
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(birthdayLabel)
        stackView.addArrangedSubview(jobLabel)
        
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(stackView)
        
        let topConstraint = AutoLayoutHelper.constraint(stackView, attribute: .top, superView: avatarView, attribute: .bottom, constant: 20)
        let centerXConstraint = AutoLayoutHelper.equalConstraint(stackView, superView: view, attribute: .centerX)
        AutoLayoutHelper.sameWidth(stackView, superView: view, multiplier: 1/2)
        
        view.addConstraints([centerXConstraint, topConstraint])
    }
    
}

