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
    
    private lazy var scenesStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
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
        setupScenesList()
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
        
        // Добавляем scenesStackView в scrollView
        scrollView.addSubview(scenesStackView)
        
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
            buttonView.heightAnchor.constraint(equalToConstant: 80),
            
            // Констрейнты для scenesStackView внутри scrollView
            scenesStackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 8),
            scenesStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 4),
            scenesStackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -4),
            scenesStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -4),
            scenesStackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -8)
        ])
        
        // Устанавливаем scrollView как расширяемый элемент в стеке
        contentStackView.setCustomSpacing(0, after: headerView)
        contentStackView.setCustomSpacing(0, after: scrollView)
    }
    
    private func setupScenesList() {
        HomeScenesList.scenes.enumerated().forEach { index, scene in
            let itemView = SceneListItemView()
            itemView.delegate = self
            itemView.sceneIndex = index
            itemView.configure(with: scene.title, icon: scene.icon)
            itemView.translatesAutoresizingMaskIntoConstraints = false
            scenesStackView.addArrangedSubview(itemView)
        }
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

// MARK: - SceneListItemViewDelegate

extension HomeViewController: SceneListItemViewDelegate {
    func sceneListItemDidTap(_ view: SceneListItemView) {
        let scene = HomeScenesList.scenes[view.sceneIndex]
        let viewController = scene.viewController.init()
        navigationController?.pushViewController(viewController, animated: true)
    }
} 
