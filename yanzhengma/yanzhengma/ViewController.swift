//
//  ViewController.swift
//  yanzhengma
//
//  Created by zetafin on 2018/6/20.
//  Copyright © 2018年 赵宏亚. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        let codeView = CodeView.init(frame: .init(x: 0, y: 60, width: 87, height: 42))
        
        self.view.addSubview(codeView)
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

