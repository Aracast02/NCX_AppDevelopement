//
//  Queue.swift
//  DataStructuresAndAlgorithms
//
//  Created by Arantza Castro Dessavre on 22/03/24.
//

import Foundation
import Dispatch

public class Queue<T>
{
    fileprivate var list = LinkedList<T>()
    
    public var isEmpty: Bool { return list.isEmpty }
    
    private var lock = DispatchGroup.init()
    
    public init()
    {
        //
    }
    
    public func enqueue(_ element: T)
    {
        lock.enter()
        list.append(value: element)
        lock.leave()
    }
    
    public func dequeue() -> T?
    {
        lock.enter()
        guard !list.isEmpty, let element = list.first
        else
        {
            return nil
        }
        
        let poppedValue = list.pop(node: element)
        lock.leave()
        
        return poppedValue
    }
    
    public func peek() -> T?
    {
        return list.first?.value
    }
    
    public func allElements() -> [T] 
    {
        var elements = [T]()
        var currentNode = list.first
        while let node = currentNode {
            elements.append(node.value)
            currentNode = node.next
        }
        return elements
    }

}

extension Queue: CustomStringConvertible
{
    public var description: String
    {
        return list.description
    }
}
