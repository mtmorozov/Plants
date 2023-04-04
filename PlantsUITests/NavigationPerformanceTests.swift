//
//  NavigationPerformanceTests.swift
//  PlantsUITests
//
//  Created by Dmitrii Morozov on 19/02/2023.
//

import XCTest

final class NavigationPerformanceTests: XCTestCase {
    let app = XCUIApplication()

    func testNavigationTransition() {
        app.launch()
        let collection = app.collectionViews.firstMatch
        let measureOptions = XCTMeasureOptions()
        measureOptions.invocationOptions = [.manuallyStop]

        measure(metrics: [XCTOSSignpostMetric.navigationTransitionMetric], options: measureOptions) {
            let label = app.staticTexts["Monstera"]
            label.tap()
            let detailsView = app.otherElements["details_viewcontroller.view"]
            app.navigationBars.buttons.element(boundBy: 0).tap()
            stopMeasuring()
        }
    }
}
