//
//  ViewController.swift
//  Picker View with Text Field
//
//  Created by Melisa Erdem on 17.02.2024.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {

    var pickerView:UIPickerView?
    
    @IBOutlet weak var textField: UITextField!
    var ulkeler: [String] = ["Türkiye", "Almanya", "Fransa", "Hollanda", "Birleşik Krallık", "ABD", "İtalya", "İspanya", "Çin", "Japonya", "Rusya", "Kanada"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let toolbar = UIToolbar()
        toolbar.tintColor = UIColor.red
        toolbar.sizeToFit()
        pickerView = UIPickerView()
        pickerView?.delegate=self
        pickerView?.dataSource=self
        textField.inputView=pickerView
        let tamamButon = UIBarButtonItem(title: "Tamam", style: .plain, target: self, action: #selector(self.tamam))
        let iptalButon = UIBarButtonItem(title: "İptal", style: .plain, target: self, action: #selector(self.iptal))
        let boslukButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolbar.setItems([tamamButon,boslukButton,iptalButon], animated: true)
        textField.inputAccessoryView=toolbar
    }
    @objc func tamam(){
        textField.text = ""
        view.endEditing(true)
    }
    @objc func iptal(){
        view.endEditing(true)
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return ulkeler.count
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return ulkeler[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        textField.text = ulkeler[row]
    }
     
}

