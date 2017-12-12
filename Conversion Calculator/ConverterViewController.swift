//
//  ConverterViewController.swift
//  Conversion Calculator
//
//  Created by Aidan Madden on 11/9/17.
//  Copyright © 2017 Aidan Madden. All rights reserved.
//

import UIKit
class ConverterViewController: UIViewController {
    var converterState = 0
    var numberPressed = 0
    var digits = [Int]()
    
    @IBAction func button(_ sender: Any) {
        switch (sender as! UIButton).tag{
        case 0:
           inputDisplay.text?.append(String(0))
           let currentText = Double(inputDisplay.text!)
           let result = getNumber(inputNumber: currentText!, state: converterState)
           outputDisplay.text = String(result)
            
        case 1:
            inputDisplay.text?.append(String(1))
            let currentText = Double(inputDisplay.text!)
            let result = getNumber(inputNumber: currentText!, state: converterState)
            outputDisplay.text = String(result)


        case 2:
            inputDisplay.text?.append(String(2))
            let currentText = Double(inputDisplay.text!)
            let result = getNumber(inputNumber: currentText!, state: converterState)
            outputDisplay.text = String(result)


        case 3:
           inputDisplay.text?.append(String(3))
           let currentText = Double(inputDisplay.text!)
           let result = getNumber(inputNumber: currentText!, state: converterState)
           outputDisplay.text = String(result)


        case 4:
            inputDisplay.text?.append(String(4))
            let currentText = Double(inputDisplay.text!)
            let result = getNumber(inputNumber: currentText!, state: converterState)
            outputDisplay.text = String(result)


        case 5:
            inputDisplay.text?.append(String(5))
            let currentText = Double(inputDisplay.text!)
            let result = getNumber(inputNumber: currentText!, state: converterState)
            outputDisplay.text = String(result)


        case 6:
            inputDisplay.text?.append(String(6))
            let currentText = Double(inputDisplay.text!)
            let result = getNumber(inputNumber: currentText!, state: converterState)
            outputDisplay.text = String(result)


        case 7:
            inputDisplay.text?.append(String(7))
            let currentText = Double(inputDisplay.text!)
            let result = getNumber(inputNumber: currentText!, state: converterState)
            outputDisplay.text = String(result)

        case 8:
            inputDisplay.text?.append(String(8))
            let currentText = Double(inputDisplay.text!)
            let result = getNumber(inputNumber: currentText!, state: converterState)
            outputDisplay.text = String(result)


        case 9:
            inputDisplay.text?.append(String(9))
            let currentText = Double(inputDisplay.text!)
            let result = getNumber(inputNumber: currentText!, state: converterState)
            outputDisplay.text = String(result)


        case 10:
            inputDisplay.text = ""
            outputDisplay.text = ""
        case 11:
            let currentText = Double(inputDisplay.text!)
            let negativeInput = currentText! * -1
            let result = getNumber(inputNumber: negativeInput, state: converterState)
            inputDisplay.text = String(negativeInput)
            outputDisplay.text = String(result)

            
            
        case 12:
            let character: Character = "."
            let isDecimal = inputDisplay.text?.contains(character)
            if(isDecimal! == true){
                return
            } else {
                inputDisplay.text?.append(".")
            }
            let currentText = Double(inputDisplay.text!)
            let result = getNumber(inputNumber: currentText!, state: converterState)
            outputDisplay.text = String(result)


        default:print("Unknown button")
            return
        }
    }
    
    func getNumber(inputNumber: Double, state: Int) -> String{
         //   inputDisplay.text?.append(String(numberPressed))
        switch state {
            case 0:
                let first = inputNumber - 32.00
                let celciusMultiplier = Double(5.00/9.00)
                let celciusValue = Double(celciusMultiplier * first)
                let decimalValue = String(format: "%.2f", celciusValue)
                return decimalValue
            case 1:
                let farenheitMultiplier = 1.8
                let farenheitValue = Double(farenheitMultiplier*inputNumber+32.00)
                let decimalValue = String(format: "%.2f", farenheitValue)
                return decimalValue
            case 2:
                let kmMultiplier = 1.60934
                let kmValue = kmMultiplier*inputNumber
                let decimalValue = String(format: "%.2f", kmValue)
                return decimalValue
            case 3:
                let miMultiplier = 0.621371
                let miValue = miMultiplier*inputNumber
                let decimalValue = String(format: "%.2f", miValue)
                return decimalValue

            default:
                return "not working properly"
        }
        
    }

    @IBOutlet weak var inputStack: UIStackView!
    @IBOutlet weak var outputStack: UIStackView!
    @IBOutlet weak var inputDisplay: UITextField!
    @IBOutlet weak var outputDisplay: UITextField!
    @IBAction func convertButton(_ sender: AnyObject) {
        let alert = UIAlertController(title: "Choose Converter", message: "", preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "farenheit to celcius", style: UIAlertActionStyle.default, handler: {
            (alertAction) -> Void in
  //          let leftLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
  //          leftLabel.text = "C"
    //        self.inputDisplay.leftView = leftLabel
            self.inputDisplay.rightView = UIImageView(image: #imageLiteral(resourceName: "far"))
            self.outputDisplay.rightView = UIImageView(image: #imageLiteral(resourceName: "celc"))
            self.converterState = 0
            let currentText = Double(self.inputDisplay.text!)
            if (currentText == nil){
                self.inputDisplay.text = ""
                self.outputDisplay.text = ""
            } else{
                let result = self.getNumber(inputNumber: currentText!, state: self.converterState)
                self.outputDisplay.text = String(result)
                self.inputDisplay.text = String(currentText!)
            }
        }))
        
        alert.addAction(UIAlertAction(title: "celcius to farenheit", style: UIAlertActionStyle.default, handler: {
            (alertAction) -> Void in
            self.inputDisplay.rightView = UIImageView(image: #imageLiteral(resourceName: "celc"))
            self.outputDisplay.rightView = UIImageView(image: #imageLiteral(resourceName: "far"))
            self.converterState = 1
            let currentText = Double(self.inputDisplay.text!)
            if (currentText == nil){
                self.inputDisplay.text = ""
                self.outputDisplay.text = ""
            } else{
                let result = self.getNumber(inputNumber: currentText!, state: self.converterState)
                self.outputDisplay.text = String(result)
                self.inputDisplay.text = String(currentText!)

            }
        }))
        
        alert.addAction(UIAlertAction(title: "miles to kilometers", style: UIAlertActionStyle.default, handler: {
            (alertAction) -> Void in
            self.inputDisplay.rightView = UIImageView(image: #imageLiteral(resourceName: "mi"))
            self.outputDisplay.rightView = UIImageView(image: #imageLiteral(resourceName: "kim"))
            self.converterState = 2
            let currentText = Double(self.inputDisplay.text!)
            if (currentText == nil){
                self.inputDisplay.text = ""
                self.outputDisplay.text = ""
            } else{
                let result = self.getNumber(inputNumber: currentText!, state: self.converterState)
                self.outputDisplay.text = String(result)
                self.inputDisplay.text = String(currentText!)

            }
        }))
        
        alert.addAction(UIAlertAction(title: "kilometers to miles", style: UIAlertActionStyle.default, handler: {
            (alertAction) -> Void in
            self.inputDisplay.rightView = UIImageView(image: #imageLiteral(resourceName: "kim"))
            self.outputDisplay.rightView = UIImageView(image: #imageLiteral(resourceName: "mi"))
            self.converterState = 3
            let currentText = Double(self.inputDisplay.text!)
            if (currentText == nil){
                self.inputDisplay.text = ""
                self.outputDisplay.text = ""
            } else{
                let result = self.getNumber(inputNumber: currentText!, state: self.converterState)
                self.outputDisplay.text = String(result)
                self.inputDisplay.text = String(currentText!)

            }
        }))
        
        
        
        self.present(alert, animated: true, completion: nil)
    }

    
    override func viewDidLoad(){
        super.viewDidLoad()
        inputDisplay.rightViewMode = .always
        inputDisplay.rightView = UIImageView(image: #imageLiteral(resourceName: "far"))
        outputDisplay.rightViewMode = .always
        outputDisplay.rightView = UIImageView(image: #imageLiteral(resourceName: "celc"))
        struct converter {
        var label: String = "farenheit to celcius"
        var inputUnit: String = "°F"
        var outputUnit: String = "°C"
    }
    var list: [converter] = []
    list.append(converter())
    list.append(converter(label: "celcius to fahrenheit", inputUnit: "°C", outputUnit: "°F"))
    list.append(converter(label: "miles to kilometers", inputUnit: "mi", outputUnit: "km"))
    list.append(converter(label: "kilometers to miles", inputUnit: "km", outputUnit: "mi"))
    }

    

}

