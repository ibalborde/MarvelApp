//
//  EventBuss.swift
//  MarvelApp
//
//  Created by Maximiliano Ibalborde on 27/10/2020.
//  Copyright © 2020 Maximiliano Ibalborde. All rights reserved.
//

import Foundation
import SwiftEventBus

enum EventBus: String {
    
    case showCharacterDetail
    case toggleDescriptionEvent
    
    // MARK: - Interface
    
    public static func listen(target: AnyObject, event: EventBus, handler: @escaping () -> ()) {
        SwiftEventBus.onMainThread(target, name: event.rawValue) { result in
            handler()
        }
    }
    
    public static func listenWithData<T>(target: AnyObject, event: EventBus, handler: @escaping (T?) -> ()) {
        SwiftEventBus.onMainThread(target, name: event.rawValue) { result in
            handler(result?.object as? T)
        }
    }
    
    public static func stopListening(target: AnyObject) {
        SwiftEventBus.unregister(target)
    }
    
    public static func post(event: EventBus, data: Any? = nil) {
        SwiftEventBus.post(event.rawValue, sender: data)
    }
    
}
