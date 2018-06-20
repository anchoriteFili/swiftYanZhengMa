//
//  CodeView.swift
//  yanzhengma
//
//  Created by zetafin on 2018/6/20.
//  Copyright © 2018年 赵宏亚. All rights reserved.
//

import UIKit

class CodeView: UIView {
    
    var changeString:String?  //验证码的字符串
    
    let kLineCount = 6
    let kLineWidth = CGFloat(2.0)
    let kCharCount = 4
    let kFontSize = UIFont.systemFont(ofSize:(CGFloat(arc4random() % 5) + 25))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let randomColor:UIColor = UIColor(red: CGFloat(CGFloat(arc4random())/CGFloat(RAND_MAX)), green: CGFloat(CGFloat(arc4random())/CGFloat(RAND_MAX)), blue: CGFloat(CGFloat(arc4random())/CGFloat(RAND_MAX)), alpha: 0.5)
        
                self.layer.cornerRadius = 5.0   //设置layer圆角半径
        //        self.layer.masksToBounds = true //隐藏边界
        
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.gray.cgColor
        self.backgroundColor = randomColor
        
        getChangeCode()
        
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func getChangeCode()
    {
        //字符素材数组
        let changeArray:NSArray = ["0","1","2","3","4","5","6","7","8","9","a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]

        
        changeString = ""
        //随机从数组中选取需要个数的字符，然后拼接为一个字符串
        
        for _ in 0 ..< kCharCount {
            let index = Int(arc4random())%(changeArray.count - 1)
            let getStr = changeArray.object(at: index)
            changeString = changeString! + (getStr as! String)
        }
        
    }
    
    
    //触摸
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        super.touchesBegan(touches, with: event)
        getChangeCode()
        setNeedsDisplay()
    }
    
    
    
    //画图
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        let randomBackColor = UIColor(red: CGFloat(CGFloat(arc4random())/CGFloat(RAND_MAX)), green: CGFloat(CGFloat(arc4random())/CGFloat(RAND_MAX)), blue: CGFloat(CGFloat(arc4random())/CGFloat(RAND_MAX)), alpha: 1.0)
        self.backgroundColor = randomBackColor
        
        //获得要显示验证码字符串，根据长度，计算每个字符显示的大概位置
        let str = NSString(string: "S")
        
        //        let font = UIFont.systemFontOfSize(20)
        let size = str.size(withAttributes: ([NSAttributedStringKey.font : kFontSize]))
        let width:CGFloat = rect.size.width / CGFloat(NSString(string: changeString!).length) - size.width
        let height = rect.size.height - size.height
        var point:CGPoint?
        var pX:CGFloat?
        var pY:CGFloat?
        
        let stringCount:Int = (changeString?.characters.count)!
        
        
        for i in 0 ..< stringCount {
            
            
            pX = CGFloat(arc4random()).truncatingRemainder(dividingBy: width) + rect.size.width / CGFloat(NSString(string: changeString!).length)*CGFloat(i)
            
            pY = CGFloat(arc4random()).truncatingRemainder(dividingBy: height)
            
            
            point = CGPoint(x:pX!, y:pY!)
            
            let c = NSString(string: changeString!).character(at: i)
            
            let codeText:NSString? = NSString(format: "%C",c)
            
            codeText!.draw(at: point!, withAttributes:  [NSAttributedStringKey.font : kFontSize])
            
        }
        
        
        
        
        
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
