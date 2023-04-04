//
//  PlantsUIPerformanceTests.swift
//  PlantsUITests
//
//  Created by Dmitrii Morozov on 19/02/2023.
//

import XCTest

final class ScrollingPerformanceTests: XCTestCase {
    let app = XCUIApplication()

    func testScrollAnimationPerformance() {
        app.launch()
        let collection = app.collectionViews.firstMatch
        let measureOptions = XCTMeasureOptions()
        measureOptions.invocationOptions = [.manuallyStop]

        measure(metrics: [XCTOSSignpostMetric.scrollingAndDecelerationMetric], options: measureOptions) {
            collection.swipeUp(velocity: .fast)
            stopMeasuring()
            collection.swipeDown(velocity: .fast)
        }
    }
}
