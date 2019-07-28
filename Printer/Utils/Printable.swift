//
//  Printable.swift
//  Printer
//
//  Created by gix on 2019/7/29.
//  Copyright © 2019 Kevin. All rights reserved.
//

import Foundation
import Ticket

public protocol Printable {
    
    func data(using encoding: String.Encoding) -> [Data]
}

extension Ticket: Printer.Printable { }
