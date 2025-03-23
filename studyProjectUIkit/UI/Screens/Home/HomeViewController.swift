import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - UI Components
    
    private lazy var contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var headerView: HomeHeaderView = {
        let view = HomeHeaderView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .systemGray6
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var buttonView: HomeButtonView = {
        let view = HomeButtonView()
        view.delegate = self
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Setup
    
    private func setupUI() {
        view.backgroundColor = .white
        title = "Главный экран"
        
        // Добавляем стек на view
        view.addSubview(contentStackView)
        
        // Добавляем компоненты в стек
        contentStackView.addArrangedSubview(headerView)
        contentStackView.addArrangedSubview(scrollView)
        contentStackView.addArrangedSubview(buttonView)
        
        // Настраиваем констрейнты
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            // Констрейнты для contentStackView
            contentStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            contentStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            // Констрейнты для размеров элементов
            headerView.heightAnchor.constraint(greaterThanOrEqualToConstant: 100),
            buttonView.heightAnchor.constraint(equalToConstant: 80)
        ])
        
        // Устанавливаем scrollView как расширяемый элемент в стеке
        contentStackView.setCustomSpacing(0, after: headerView)
        contentStackView.setCustomSpacing(0, after: scrollView)
    }
}

// MARK: - HomeButtonViewDelegate

extension HomeViewController: HomeButtonViewDelegate {
    func buttonDidTap() {
        // Обработка нажатия на кнопку
        let alert = UIAlertController(title: "Действие", message: "Вы нажали на кнопку", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
} 
