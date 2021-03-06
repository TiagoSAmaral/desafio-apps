//
//  Router.swift
//  jornalapp
//
//  Created by Tiago da Silva Amaral on 14/08/18.
//  Copyright © 2018 com.outlook.tiagofly. All rights reserved.
//

import UIKit

protocol RouterInterface: class {

	func goTo(destiny: Routes, pushfoward data: Any?)
}

class Router: RouterInterface {

	weak var view: RouterViewInterface!

	init(view: RouterViewInterface) {
		self.view = view
	}

	func goTo(destiny: Routes, pushfoward data: Any?) {

		switch destiny {

		case .notices:

			let viewInstance: NewsView = self.buildView(NewsView.identifier, NewsView.self)
			viewInstance.presenter = News(view: viewInstance, router: self)
			self.view?.setViewControllers([viewInstance], animated: false)

		case .noticedetail:

			let viewInstance: NewsDetailView = self.buildView(NewsDetailView.identifier, NewsDetailView.self)
			viewInstance.presenter = NewsDetail(view: viewInstance, router: self, data: data as! Novelty)
			self.view?.pushViewController(viewInstance, animated: true)

		case .externallink:

			guard let notice = data as? Novelty else {
				return
			}
			UIApplication.shared.openURL(notice.mobileUrl!)
		}
	}

	func buildView<T>(_ identifier: String, _ viewClass: T.Type) -> T{

		return UIStoryboard(name: identifier, bundle: nil).instantiateViewController(withIdentifier: identifier) as! T
	}
}
