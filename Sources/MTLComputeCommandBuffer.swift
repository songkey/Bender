
//
//  MTLComputeCommandEncoder.h
//  Metal
//
//  Copyright (c) 2014 Apple Inc. All rights reserved.
//

public struct MTLDispatchThreadgroupsIndirectArguments {

    public var threadgroupsPerGrid: (UInt32, UInt32, UInt32)

    public init()

    public init(threadgroupsPerGrid: (UInt32, UInt32, UInt32))
}


import MetalPerformanceShaders

/*!
 @protocol MTLComputeCommandEncoder
 @abstract A command encoder that writes data parallel compute commands.
 */
@available(iOS 8.0, *)
public protocol MTLComputeCommandEncoder : MTLCommandEncoder {


    /*!
     @method setComputePipelineState:
     @abstract Set the compute pipeline state that will be used.
     */
    public func setComputePipelineState(_ state: MTLComputePipelineState)


    /*!
     @method setBytes:length:atIndex:
     @brief Set the data (by copy) for a given buffer binding point.  This will remove any existing MTLBuffer from the binding point.
     */
    @available(iOS 8.3, *)
    public func setBytes(_ bytes: UnsafeRawPointer, length: Int, at index: Int)


    /*!
     @method setBuffer:offset:atIndex:
     @brief Set a global buffer for all compute kernels at the given bind point index.
     */
    public func setBuffer(_ buffer: MTLBuffer?, offset: Int, at index: Int)


    /*!
     @method setBufferOffset:atIndex:
     @brief Set the offset within the current global buffer for all compute kernels at the given bind point index.
     */
    @available(iOS 8.3, *)
    public func setBufferOffset(_ offset: Int, at index: Int)


    /*!
     @method setBuffers:offsets:withRange:
     @brief Set an array of global buffers for all compute kernels with the given bind point range.
     */
    public func setBuffers(_ buffers: UnsafePointer<MTLBuffer?>!, offsets: UnsafePointer<Int>!, with range: NSRange)


    /*!
     @method setTexture:atIndex:
     @brief Set a global texture for all compute kernels at the given bind point index.
     */
    public func setTexture(_ texture: MTLTexture?, at index: Int)


    /*!
     @method setTextures:withRange:
     @brief Set an array of global textures for all compute kernels with the given bind point range.
     */
    public func setTextures(_ textures: UnsafePointer<MTLTexture?>?, with range: NSRange)


    /*!
     @method setSamplerState:atIndex:
     @brief Set a global sampler for all compute kernels at the given bind point index.
     */
    public func setSamplerState(_ sampler: MTLSamplerState?, at index: Int)


    /*!
     @method setSamplers:withRange:
     @brief Set an array of global samplers for all compute kernels with the given bind point range.
     */
    public func setSamplerStates(_ samplers: UnsafePointer<MTLSamplerState?>?, with range: NSRange)


    /*!
     @method setSamplerState:lodMinClamp:lodMaxClamp:atIndex:
     @brief Set a global sampler for all compute kernels at the given bind point index.
     */
    public func setSamplerState(_ sampler: MTLSamplerState?, lodMinClamp: Float, lodMaxClamp: Float, at index: Int)


    /*!
     @method setSamplers:lodMinClamps:lodMaxClamps:withRange:
     @brief Set an array of global samplers for all compute kernels with the given bind point range.
     */
    public func setSamplerStates(_ samplers: UnsafePointer<MTLSamplerState?>?, lodMinClamps: UnsafePointer<Float>?, lodMaxClamps: UnsafePointer<Float>?, with range: NSRange)


    /*!
     @method setThreadgroupMemoryLength:atIndex:
     @brief Set the threadgroup memory byte length at the binding point specified by the index. This applies to all compute kernels.
     */
    public func setThreadgroupMemoryLength(_ length: Int, at index: Int)


    @available(iOS 10.0, *)
    public func setStageInRegion(_ region: MTLRegion)


    /*
     @method dispatchThreadgroups:threadsPerThreadgroup:
     @abstract Enqueue a compute function dispatch.
     */
    public func dispatchThreadgroups(_ threadgroupsPerGrid: MTLSize, threadsPerThreadgroup: MTLSize)


    /*
     @method dispatchThreadgroupsWithIndirectBuffer:indirectBufferOffset:threadsPerThreadgroup:
     @abstract Enqueue a compute function dispatch using an indirect buffer for threadgroupsPerGrid see MTLDispatchThreadgroupsIndirectArguments.
     @param indirectBuffer A buffer object that the device will read dispatchThreadgroups arguments from, see MTLDispatchThreadgroupsIndirectArguments.
     @param indirectBufferOffset Byte offset within @a indirectBuffer to read arguments from.  @a indirectBufferOffset must be a multiple of 4.
     */
    @available(iOS 9.0, *)
    public func dispatchThreadgroups(indirectBuffer: MTLBuffer, indirectBufferOffset: Int, threadsPerThreadgroup: MTLSize)


    /*!
     @method updateFence:
     @abstract Update the event to capture all GPU work so far enqueued by this encoder.
     @discussion The event is updated at kernel submission to maintain global order and prevent deadlock.
     Drivers may delay fence updates until the end of the encoder. Drivers may also wait on fences at the beginning of an encoder. It is therefore illegal to wait on a fence after it has been updated in the same encoder.
     */
    @available(iOS 10.0, *)
    public func updateFence(_ fence: MTLFence)


    /*!
     @method waitForFence:
     @abstract Prevent further GPU work until the event is reached.
     @discussion The event is evaluated at kernel submision to maintain global order and prevent deadlock.
     Drivers may delay fence updates until the end of the encoder. Drivers may also wait on fences at the beginning of an encoder. It is therefore illegal to wait on a fence after it has been updated in the same encoder.
     */
    @available(iOS 10.0, *)
    public func waitForFence(_ fence: MTLFence)
}
