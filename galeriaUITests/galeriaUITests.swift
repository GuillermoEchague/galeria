//
//  galeriaUITests.swift
//  galeriaUITests
//
//  Created by Guillermo Echague on 22-12-24.
//

import XCTest

final class galeriaUITests: XCTestCase {
    var app: XCUIApplication!
    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch() // Lanza la aplicación
    }


    func testNavigationToHeroListAndCustomElementsAndBack() throws {
           // Verifica que estamos en la pantalla principal
           let mainViewTitle = app.staticTexts["APP SUPER HÉROES"]
           XCTAssertTrue(mainViewTitle.exists, "El título 'APP SUPER HÉROES' no existe en la pantalla principal.")
           
           // Navegar a "Ver Héroes"
           let viewHeroesButton = app.buttons["Ver Héroes"]
           XCTAssertTrue(viewHeroesButton.exists, "El botón 'Ver Héroes' no existe en la pantalla principal.")
           viewHeroesButton.tap()

           // Verifica que estamos en la pantalla "Héroes"
           let heroListTitle = app.navigationBars["Héroes"]
           XCTAssertTrue(heroListTitle.exists, "No se navegó correctamente a la pantalla de 'Héroes'.")

           // Regresar a la pantalla principal
           let backButton = app.navigationBars.buttons.firstMatch
           XCTAssertTrue(backButton.exists, "El botón 'Back' no existe en la pantalla de 'Héroes'.")
           backButton.tap()

           // Verifica que estamos de vuelta en la pantalla principal
           XCTAssertTrue(mainViewTitle.exists, "No se regresó correctamente a la pantalla principal.")

           // Navegar a "Elementos Personalizados"
           let customElementsButton = app.buttons["Elementos Personalizados"]
           XCTAssertTrue(customElementsButton.exists, "El botón 'Elementos Personalizados' no existe en la pantalla principal.")
           customElementsButton.tap()

           // Verifica que estamos en la pantalla "Elementos Personalizados"
           let customElementsTitle = app.navigationBars["Héroes Personalizados"]
           XCTAssertTrue(customElementsTitle.exists, "No se navegó correctamente a la pantalla de 'Elementos Personalizados'.")

           // Regresar a la pantalla principal desde "Elementos Personalizados"
           XCTAssertTrue(backButton.exists, "El botón 'Back' no existe en la pantalla de 'Elementos Personalizados'.")
           backButton.tap()

           // Verifica que estamos de vuelta en la pantalla principal
           XCTAssertTrue(mainViewTitle.exists, "No se regresó correctamente a la pantalla principal después de 'Elementos Personalizados'.")

           // Finaliza el flujo del test
           XCTContext.runActivity(named: "Finalizando Test de Navegación") { _ in
               XCTAssertTrue(true, "Test completado exitosamente.")
           }
       }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
