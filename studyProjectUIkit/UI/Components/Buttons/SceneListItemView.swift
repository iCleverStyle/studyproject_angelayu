import UIKit

protocol SceneListItemViewDelegate: AnyObject {
    func sceneListItemDidTap(_ view: SceneListItemView)
}

class SceneListItemView: UIView {
    
    // MARK: - Public Properties
    
    weak var delegate: SceneListItemViewDelegate?
    var sceneIndex: Int = 0
    
    // MARK: - Private Properties
    
    private lazy var button: UIButton = {
        var configuration = UIButton.Configuration.filled()
        configuration.baseBackgroundColor = .white
        configuration.baseForegroundColor = .systemBlue
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 12, leading: 16, bottom: 12, trailing: 16)
        configuration.cornerStyle = .medium
        
        let button = UIButton(configuration: configuration)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.systemGray4.cgColor
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Methods
    
    func configure(with title: String) {
        var configuration = button.configuration
        configuration?.title = title
        button.configuration = configuration
    }
    
    // MARK: - Private Methods
    
    private func setupUI() {
        addSubview(button)
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: topAnchor),
            button.leadingAnchor.constraint(equalTo: leadingAnchor),
            button.trailingAnchor.constraint(equalTo: trailingAnchor),
            button.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    // MARK: - Actions
    
    @objc private func buttonTapped() {
        delegate?.sceneListItemDidTap(self)
    }
} 