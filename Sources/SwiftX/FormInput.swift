//
//  FormInput.swift
//  
//
//  Created by Alfredo Martinez on 9/28/20.
//

#if !os(macOS)
import UIKit

@available(iOS 11.1, tvOS 11.0, *)
public protocol FormInputEditingDelegate: class {
    func onDidEdit(textField: UITextField, status: FormInput.EditStatus)
}

@available(iOS 11.1, tvOS 11.0, *)
public class FormInput: UIView, UITextFieldDelegate {

    public enum EditStatus {
        case begin, end
    }

    weak public var delegate: FormInputEditingDelegate?
    public let label = UILabel()
    public let textField = UITextField()
    private let errorLabel = UILabel()

    public var colorOnDidFocus: UIColor = .black
    public var colorOnDidLostFocus: UIColor = .gray
    private var maxValue: Double = .infinity

    public init(text: String? = nil, placeholder: String? = nil, keyboardType: UIKeyboardType = .default, backgroundColor: UIColor? = nil, maxValue: Double = .infinity) {
        super.init(frame: .zero)

        stack(label, textField, errorLabel, spacing: 1)
        label.withHeight(20)
        textField.withHeight(40)
        errorLabel.withHeight(12)
        label.text = text
        textField.backgroundColor = backgroundColor
        textField.placeholder = placeholder
        textField.keyboardType = keyboardType
        textField.delegate = self

        self.maxValue = maxValue
        textField.addBorder(edge: .bottom, color: colorOnDidLostFocus, thickness: 1, withID: label.text?.convertedToSlug())
    }

    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func applyLabelAppearance(withFont font: UIFont = .systemFont(ofSize: 12), textColor: UIColor = .black, alignment: NSTextAlignment = .left) {
        label.font = font
        label.textColor = textColor
        label.textAlignment = alignment
    }

    public func applyTextFieldAppearance() {
        textField.backgroundColor = .clear
    }

    public func configureAccessoryView(text: String = "Done", style: UIBarButtonItem.Style = .done, target: Any, action: Selector, tag: Int = 0) {
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        doneToolbar.barStyle = .default

        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title: text, style: style, target: target, action: action)
        done.tag = tag
        textField.tag = tag

        let items = [flexSpace, done]
        doneToolbar.items = items
        doneToolbar.sizeToFit()

        textField.inputAccessoryView = doneToolbar
    }

    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        //If the text field is numeric
        if textField.keyboardType != .numberPad { return true }
        //If the new character is decimal digits or backspace
        guard (string.rangeOfCharacter(from: .decimalDigits) != nil) || string.isEmpty else { return false }

        //if we check a max value
        if maxValue != .infinity && !string.isEmpty {
            let newText = (textField.text! as NSString).replacingCharacters(in: range, with: string) as String
            if let num = Double(newText), num >= 0 && num <= maxValue {
                return true
            } else {
                return false
            }
        }

        return true
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {
        markWithColor(color: colorOnDidFocus)
        delegate?.onDidEdit(textField: textField, status: .begin)
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        markWithColor(color: colorOnDidLostFocus)
        delegate?.onDidEdit(textField: textField, status: .end)
    }

    public func setError(withText text: String, withColor color: UIColor = .red) {
        errorLabel.text = text
        markWithColor(color: color)
    }

    public func clearError() {
        errorLabel.text = nil
        markWithColor(color: colorOnDidLostFocus)
    }

    private func markWithColor(color: UIColor) {
        textField.subviews.forEach { (child) in
            if child.id == label.text?.convertedToSlug() {
                child.backgroundColor = color
            }
        }
    }

    public func applyStatusAppearance(withIcon icon: UIImage? = nil) {
        let view = UIImageView(image: icon)
        view.frame = .init(x: 0, y: 0, width: 3, height: 40)
        textField.rightView = view
        textField.rightViewMode = .always
    }

    public func clearStatusAppearance() {
        textField.rightView = nil
        textField.rightViewMode = .never
    }
}
#endif
