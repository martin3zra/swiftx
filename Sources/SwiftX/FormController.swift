//
//  FormController.swift
//  
//
//  Created by Alfredo Martinez on 9/28/20.
//

#if !os(macOS)
import UIKit

@available(iOS 11.0, tvOS 11.0, *)
open class FormController: UIViewController {

    var lowestElement: UIView!
    var lastKnownOrigin: CGPoint = .zero

    fileprivate let alignment: alignment

    init(alignment: alignment = .top) {
        self.alignment = alignment
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public lazy var scrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.contentInsetAdjustmentBehavior = .never
        sv.contentSize = view.frame.size
        sv.keyboardDismissMode = .interactive
        sv.alwaysBounceVertical = true
        return sv
    }()


    public let containerStackView: UIStackView = {
        let sv = UIStackView()
        sv.isLayoutMarginsRelativeArrangement = true
        sv.axis = .vertical
        return sv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        view.add(scrollView)
        scrollView.fillSuperview()
        scrollView.add(containerStackView)

        if self.alignment == .top {
            containerStackView.anchor(top: scrollView.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor)
        } else {
            containerStackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
            containerStackView.centerInSuperview()
        }

        setupKeyboardNotifications()

    }

    lazy fileprivate var distanceToBottom = self.distanceFromLowestElementToBottom()

    fileprivate func distanceFromLowestElementToBottom() -> CGFloat {
        if lowestElement != nil {
            guard let frame = lowestElement.superview?.convert(lowestElement.frame, to: view) else { return 0 }
            let distance = view.frame.height - frame.origin.y - frame.height
            return distance
        }

        return view.frame.height - containerStackView.frame.maxY
    }

    fileprivate func setupKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    @objc fileprivate func handleKeyboardShow(notification: Notification) {
        guard let value = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
        let keyboardFrame = value.cgRectValue

        let bottomPadding: CGFloat = UIApplication.shared.windows.filter({$0.isKeyWindow}).first?.safeAreaInsets.bottom ?? 0
        let point: CGPoint = .init(x: 0, y: lastKnownOrigin.y - (keyboardFrame.height + bottomPadding))
        scrollView.setContentOffset(point, animated: true)

        self.scrollView.verticalScrollIndicatorInsets.bottom = keyboardFrame.height
    }

    @objc fileprivate func handleKeyboardHide() {
        self.scrollView.contentInset.bottom = 0
        self.scrollView.verticalScrollIndicatorInsets.bottom = 0
        scrollView.setContentOffset(.init(x: 0, y: 0), animated: true)
    }

    public enum FormAlignment {
        case top, center
    }

    deinit {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    public enum alignment {
        case top, center
    }

}
#endif
