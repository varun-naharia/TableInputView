//
//  ViewController.swift
//  TableInputView
//
//  Created by Varun Naharia on 20/04/17.
//  Copyright © 2017 Varun Naharia. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tblView: UITableView!
    @IBOutlet weak var txtInputField: UITextField!
    let data:[String] = ["1","2","3","4","5","6","7"]
    override func viewDidLoad() {
        super.viewDidLoad()
        txtInputField.inputView = tblView
        let toolBar = UIToolbar().ToolbarPiker(selector: #selector(ViewController.dismissPicker))
        
        txtInputField.inputAccessoryView = toolBar
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        cell?.textLabel?.text = data[indexPath.row]
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        txtInputField.text = data[indexPath.row]
    }
    
    func dismissPicker(){
        if(txtInputField.text == "")
        {
            txtInputField.text = data[0]
        }
        view.endEditing(true)
    }


}

extension UIToolbar {
    
    func ToolbarPiker(selector : Selector) -> UIToolbar {
        
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor.black
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.plain, target: self, action: selector)
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        
        toolBar.setItems([ spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        return toolBar
    }
    
}

