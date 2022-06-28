//
//  SearchViewController.swift
//  musicInfoApp
//
//  Created by Alexander Pavlovets on 24.06.2022.
//

import UIKit

final class SearchViewController: UIViewController {
    
    //MARK: - ViewModel
    private var viewModel: SearchVCViewModelProtocol = SearchVCViewModel()
    
    //MARK: - init
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupElement()
        self.bind()
        self.navigationItem.searchController = self.searchController
    }
    
    //MARK: - UINib
    private var nibCell = UINib(nibName: "\(SearchTableViewCell.self)", bundle: nil)
    
    //MARK: - GUI
    private lazy var tableView: UITableView = {
        let table = UITableView(frame: .zero)
        table.delegate = self
        table.dataSource = self
        table.separatorStyle = .none
        table.register(nibCell, forCellReuseIdentifier: "\(SearchTableViewCell.self)")
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    //MARK: - Search Controller
    private lazy var searchController: UISearchController = {
        let search = UISearchController(searchResultsController: nil)
        search.searchBar.delegate = self
        search.obscuresBackgroundDuringPresentation = false
        return search
    }()
    
    //MARK: - ViewModel bind
    private func bind() {
        viewModel.delegate = self
    }
    
    //MARK: - Constraints
    private func setupElement() {
        self.title = "Songs"
        self.view.addSubview(self.tableView)
        //        searchBar(searchController.searchBar, textDidChange: "dua Lipa")
    }
    
    override func viewDidLayoutSubviews() {
        NSLayoutConstraint.activate([self.tableView.topAnchor.constraint(equalTo: view.topAnchor),
                                     self.tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
                                     self.tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
                                     self.tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)])
    }
}

//MARK: - TableViewDataSourse / TableViewDelegate
extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.countSongs
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let song = viewModel.getSong(indexPath: indexPath)
        let cell = tableView.dequeueReusableCells(type: SearchTableViewCell.self, indexPath: indexPath)
        cell.setter(song: song)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let nextVC = SongDetailedViewController()
        nextVC.viewModel.setSong(song: viewModel.getSong(indexPath: indexPath))
        present(nextVC, animated: true, completion: nil)
    }
}

//MARK: - SearchVCViewModelDelegate
extension SearchViewController: SearchVCViewModelDelegate {
    func tableViewReloadData() {
        self.tableView.reloadData()
    }
}

//MARK: - UISearchBarDelegate
extension SearchViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.getSongWithSearchString(str: searchText)
    }
    
    func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {
        return true
    }
}
