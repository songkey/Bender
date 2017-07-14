//
//  Dummy.swift
//  Bender
//
//  Created by Mathias Claassen on 5/9/17.
//
//

#if !((arch(i386) || arch(x86_64)) && os(iOS))
    import MetalPerformanceShaders
#endif

/// Dummy layers are helpers for certain situations and are removed before execution starts.
open class Dummy: NetworkLayer {

    // Dummy layers should be removed after initialize
    // Assign inputs to outputs and vice versa
    open override func initialize(network: Network, device: MTLDevice) {
        super.initialize(network: network, device: device)
        removeFromGraph()
    }

    open override func execute(commandBuffer: MTLCommandBuffer) {
        fatalError("Dummy in execution list")
    }
    
}
