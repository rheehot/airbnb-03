import UIKit

protocol DatesFilterFixedFooterViewDelegate: class {
    func didTapSearchButton()
}

final class DatesFilterFixedFooterView: UIView, ViewFromXib {
    
    private enum Color {
        static let searchButtonEnabled: UIColor? = UIColor(named: "button.enabled")
        static let searchButtonDisabled: UIColor? = UIColor(named: "button.disabled")
    }
    
    static var xibName: String = String(describing: DatesFilterFixedFooterView.self)
    static let height: CGFloat = 96
    
    @IBOutlet weak var searchButton: DatesFilterSearchButton! {
        didSet {
            configureSearchButton()
        }
    }
    
    weak var delegate: DatesFilterFixedFooterViewDelegate?
    
    override func draw(_ rect: CGRect) {
        drawEdgeLine(edge: .top, lineWidth: 0.3, lineColor: .lightGray)
    }
    
    private func configureSearchButton() {
        searchButton.setTitleColor(.white, for: .normal)
        searchButton.setTitleColor(.darkGray, for: .disabled)
        searchButton.backgroundColor = Color.searchButtonDisabled
        searchButton.tintColor = .black
        searchButton.isEnabled = false
    }
    
    func updateSearchButton(with isSelected: Bool) {
        searchButton.isEnabled = isSelected
        searchButton.backgroundColor = isSelected ? Color.searchButtonEnabled : Color.searchButtonDisabled
        searchButton.tintColor = isSelected ? .white : .black
    }
    
    @IBAction func didTapSearch(_ sender: Any) {
        delegate?.didTapSearchButton()
    }
}
