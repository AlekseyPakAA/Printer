//
//  ViewController.swift
//  Example
//
//  Created by GongXiang on 12/8/16.
//  Updated by Pradeep Sakharelia on 15/05/19
//  Copyright © 2016 Kevin. All rights reserved.
//

import UIKit
import Printer

class ViewController: UIViewController {

    private let bluetoothPrinterManager = BluetoothPrinterManager()
    private let dummyPrinter = DummyPrinter()
 
    @IBAction func touchPrint(sender: UIButton) {

        guard let image = UIImage(named: "demo_3") else {
            return
        }

        var ticket = Ticket(
            .image(image, attributes: .alignment(.right))
        )
        
        ticket.feedLinesOnHead = 2
        ticket.feedLinesOnTail = 3
        
        if bluetoothPrinterManager.canPrint {
            bluetoothPrinterManager.print(ticket)
        }
        
        dummyPrinter.print(ticket)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? BluetoothPrinterSelectTableViewController {
            vc.sectionTitle = "Choose Bluetooth Printer"
            vc.printerManager = bluetoothPrinterManager
        }
    }
}
