//
//  Message.swift
//  Telegramme
//
//  Created by MAD2_P02 on 27/11/19.
//  Copyright © 2019 Lee Joey. All rights reserved.
//

import Foundation

class Message {
    var date:Date
    var isSender:DarwinBoolean
    var text:String
    
    init(d:Date, s:DarwinBoolean, t:String){
        date = d
        isSender = s
        text = t
    }
}
