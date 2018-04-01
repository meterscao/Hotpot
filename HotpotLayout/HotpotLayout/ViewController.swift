//
//  ViewController.swift
//  HotpotLayout
//
//  Created by R0uter on 2018/4/1.
//  Copyright © 2018 R0uter. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let redView = UIView()
    let blueView = UIView()
    let blackView =  UIView()
    let orangeView = UIView()
    let nameLabel = UILabel()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        redView.layer.cornerRadius = 4
        redView.backgroundColor = UIColor.red.withAlphaComponent(0.7)
        redView.layer.masksToBounds = true
        view.addSubview(redView)
        
        blueView.backgroundColor = UIColor.blue.withAlphaComponent(0.8)
        blueView.layer.cornerRadius = 4
        blueView.layer.masksToBounds = true
        view.addSubview(blueView)
        
        blackView.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        blackView.layer.cornerRadius = 4
        blackView.layer.masksToBounds = true
        view.addSubview(blackView)
        
        orangeView.backgroundColor = UIColor.orange.withAlphaComponent(0.8)
        orangeView.layer.cornerRadius = 20
        orangeView.layer.masksToBounds = true
        view.addSubview(orangeView)
        
        nameLabel.text = "I LOVE HOTPOT"
        nameLabel.textAlignment = .center
        nameLabel.backgroundColor = UIColor.purple.withAlphaComponent(0.7)
        nameLabel.layer.masksToBounds = true
        nameLabel.textColor = UIColor.white
        nameLabel.font = UIFont.systemFont(ofSize: 18)
        view.addSubview(nameLabel)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        redView.frameLayout { $0
            .left.equal(to: view.left).offset(20)
            .right.equal(to: view.right).offset(-20)
            .height.equal(to: 40)
            .top.equal(to: view.top).offset(view.layoutMargins.top+40)
        }
        
        blueView.frameLayout { $0
            .width.equal(to: 100)
            .centerX.equal(to: view.centerX)
            .bottom.equal(to: view.bottom).offset(view.layoutMargins.bottom-50)
            .height.equal(to: 40)
        }
        blackView.frameLayout { $0
            .height.equal(to: 100)
            .centerY.equal(to: view.centerY)
            .left.equal(to: view.left).offset(20)
            .right.equal(to: blueView.left)
        }
        
        orangeView.frameLayout { $0
            .width.equal(to: 40)
            .height.equal(to: 40)
            .left.equal(to: blackView.left).offset(100)
            .top.equal(to: blackView.bottom).offset(200)
        }
        
        nameLabel.frameLayout { $0
            .right.equal(to: redView.right)
            .bottom.equal(to: blackView.top).offset(-20)
        }
    }


}

