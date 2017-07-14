//
//  MetalPerformanceShadersStub.swift
//  Bender
//
//  Created by Santiago Castro on 7/14/17.
//
//

#if (arch(i386) || arch(x86_64)) && os(iOS)
    public class MPSCNNConvolution: MPSCNNKernel {
        public init(device: MTLDevice, convolutionDescriptor: MPSCNNConvolutionDescriptor, kernelWeights: UnsafePointer<Float>, biasTerms: UnsafePointer<Float>?, flags: MPSCNNConvolutionFlags) {}
    }
    open class MPSCNNConvolutionDescriptor {
        open var kernelWidth: Int!
        open var kernelHeight: Int!
        open var inputFeatureChannels: Int!
        open var outputFeatureChannels: Int!
        open var strideInPixelsX: Int!
        open var strideInPixelsY: Int!
        open var groups: Int!
        open var neuron: MPSCNNNeuron?
        public convenience init(kernelWidth: Int, kernelHeight: Int, inputFeatureChannels: Int, outputFeatureChannels: Int, neuronFilter: MPSCNNNeuron?) {}
    }
    public enum MPSCNNConvolutionFlags : UInt {
        case none
    }
    public class MPSCNNFullyConnected: MPSCNNKernel {}
    open class MPSCNNKernel {
        open var offset: MPSOffset!
        open var edgeMode: MPSImageEdgeMode!

        open func encode(commandBuffer: MTLCommandBuffer, sourceImage: MPSImage, destinationImage: MPSImage) {}
    }
    open class MPSCNNNeuron: MPSCNNKernel {}
    open class MPSCNNNeuronLinear : MPSCNNNeuron {
        open var a: Float!
        open var b: Float!
        public init(device: MTLDevice, a: Float, b: Float) {}
    }
    open class MPSCNNNeuronReLU : MPSCNNNeuron {
        open var a: Float!
        public init(device: MTLDevice, a: Float) {}
    }
    open class MPSCNNNeuronSigmoid : MPSCNNNeuron {
        public init(device: MTLDevice) {}
    }
    open class MPSCNNNeuronTanH : MPSCNNNeuron {
        open var a: Float!
        open var b: Float!
        public init(device: MTLDevice, a: Float, b: Float) {}
    }
    open class MPSCNNNeuronAbsolute : MPSCNNNeuron {
        public init(device: MTLDevice) {}
    }
    public class MPSCNNPooling: MPSCNNKernel {
        open var kernelWidth: Int!
        open var kernelHeight: Int!
        open var strideInPixelsX: Int!
        open var strideInPixelsY: Int!

        public convenience init(device: MTLDevice, kernelWidth: Int, kernelHeight: Int) {}
        public init(device: MTLDevice, kernelWidth: Int, kernelHeight: Int, strideInPixelsX: Int, strideInPixelsY: Int) {}
    }
    public class MPSCNNPoolingAverage: MPSCNNPooling {}
    public class MPSCNNPoolingMax: MPSCNNPooling {}
    public class MPSCNNSoftMax: MPSCNNKernel {
        public init(device: MTLDevice) {}
    }
    public class MPSCNNSpatialNormalization: MPSCNNKernel {}
    public class MPSImage {
        open var device: MTLDevice!
        open var width: Int!
        open var height: Int!
        open var featureChannels: Int!
        open var numberOfImages: Int!
        open var textureType: MTLTextureType!
        open var pixelFormat: MTLPixelFormat!
        open var precision: Int!
        open var usage: MTLTextureUsage!
        open var pixelSize: Int!
        open var texture: MTLTexture!
        open var label: String?
        public init(device: MTLDevice, imageDescriptor: MPSImageDescriptor) {}
    }
    public class MPSImageDescriptor {
        public convenience init(channelFormat: MPSImageFeatureChannelFormat, width: Int, height: Int, featureChannels: Int) {}
        public convenience init(channelFormat: MPSImageFeatureChannelFormat, width: Int, height: Int, featureChannels: Int, numberOfImages: Int, usage: MTLTextureUsage) {}
    }
    public enum MPSImageEdgeMode : UInt {
        case zero
        case clamp
    }
    public enum MPSImageFeatureChannelFormat : UInt {
        case invalid
        case unorm8
        case unorm16
        case float16
        case float32
    }
    public class MPSImageLanczosScale {
        public init(device: MTLDevice) {}
        public func encode(commandBuffer: MTLCommandBuffer, sourceTexture: MTLTexture, destinationTexture: MTLTexture) {}
    }
    public struct MPSOffset {
        public var x: Int
        public var y: Int
        public var z: Int
        public init() {}
        public init(x: Int, y: Int, z: Int) {}
    }
    public class MPSTemporaryImage: MPSImage {
        open var readCount: Int!
        public convenience init(commandBuffer: MTLCommandBuffer, imageDescriptor: MPSImageDescriptor) {}
    }
    public class MTLBlitCommandEncoder: MTLCommandEncoder {}
    public class MTLBuffer {
        public func contents() -> UnsafeMutableRawPointer {
            let a: UnsafeMutableRawPointer? = nil
            return a!
        }
    }
    public class MTLCommandBuffer {
        public var label: String?
        public func commit() {}
        public func makeBlitCommandEncoder() -> MTLBlitCommandEncoder {
            return MTLBlitCommandEncoder()
        }
        public func makeComputeCommandEncoder() -> MTLComputeCommandEncoder {
            return MTLComputeCommandEncoder()
        }
        public func waitUntilCompleted() {}
    }
    public class MTLCommandEncoder {
        public var device: MTLDevice!
        public var label: String?
        public func endEncoding() {}
        public func insertDebugSignpost(_ string: String) {}
        public func pushDebugGroup(_ string: String) {}
        public func popDebugGroup() {}
    }
    public class MTLComputeCommandEncoder : MTLCommandEncoder {
        public func dispatchThreadgroups(_ threadgroupsPerGrid: MTLSize, threadsPerThreadgroup: MTLSize) {}
        public func setBuffer(_ buffer: MTLBuffer?, offset: Int, at index: Int) {}
        public func setComputePipelineState(_ state: MTLComputePipelineState) {}
        public func setTexture(_ texture: MTLTexture?, at index: Int) {}
    }
    public class MTLCommandQueue {
        public func insertDebugCaptureBoundary() {}
        public func makeCommandBuffer() -> MTLCommandBuffer {
            return MTLCommandBuffer()
        }
    }
    public protocol MTLComputePipelineState : NSObjectProtocol {
        var device: MTLDevice { get }
        var maxTotalThreadsPerThreadgroup: Int { get }
        var threadExecutionWidth: Int { get }
    }
    public func MTLCreateSystemDefaultDevice() -> MTLDevice? {
        return MTLDevice()
    }
    public enum MTLDataType : UInt {
        case none
        case `struct`
        case array
        case float
        case float2
        case float3
        case float4
        case float2x2
        case float2x3
        case float2x4
        case float3x2
        case float3x3
        case float3x4
        case float4x2
        case float4x3
        case float4x4
        case half
        case half2
        case half3
        case half4
        case half2x2
        case half2x3
        case half2x4
        case half3x2
        case half3x3
        case half3x4
        case half4x2
        case half4x3
        case half4x4
        case int
        case int2
        case int3
        case int4
        case uint
        case uint2
        case uint3
        case uint4
        case short
        case short2
        case short3
        case short4
        case ushort
        case ushort2
        case ushort3
        case ushort4
        case char
        case char2
        case char3
        case char4
        case uchar
        case uchar2
        case uchar3
        case uchar4
        case bool
        case bool2
        case bool3
        case bool4
    }
    public class MTLDevice {
        public func makeBuffer(length: Int, options: MTLResourceOptions = []) -> MTLBuffer {
            return MTLBuffer()
        }

        public func makeBuffer(bytes pointer: UnsafeRawPointer, length: Int, options: MTLResourceOptions = []) -> MTLBuffer {
            return MTLBuffer()
        }
        public func makeComputePipelineState(function computeFunction: MTLFunction) throws -> MTLComputePipelineState {
            return MTLComputePipelineState()
        }
        public func makeLibrary(filepath: String) throws -> MTLLibrary {
            return MTLLibrary()
        }
    }
    public class MTLFunction {}
    open class MTLFunctionConstantValues {
        public func makeFunction(name functionName: String) -> MTLFunction? {
            return MTLFunction()
        }
        open func setConstantValue(_ value: UnsafeRawPointer, type: MTLDataType, at index: Int) {}
        open func setConstantValues(_ values: UnsafeRawPointer, type: MTLDataType, with range: NSRange) {}
        open func setConstantValue(_ value: UnsafeRawPointer, type: MTLDataType, withName name: String) {}
        open func reset() {}
    }
    public class MTLLibrary {
        public func makeFunction(name functionName: String) -> MTLFunction? {
            return MTLFunction()
        }
        public func makeFunction(name: String, constantValues: MTLFunctionConstantValues) throws -> MTLFunction {
            return MTLFunction()
        }
    }
    public class MTLOrigin {}
    public class MTLPixelFormat {}
    public struct MTLResourceOptions : OptionSet {
        public let rawValue: Int
        public init(rawValue: Int) {}
        public static var cpuCacheModeWriteCombined: MTLResourceOptions!
        public static var storageModeShared: MTLResourceOptions!
        public static var storageModePrivate: MTLResourceOptions!
        public static var storageModeMemoryless: MTLResourceOptions!
        public static var hazardTrackingModeUntracked: MTLResourceOptions!
        public static var optionCPUCacheModeWriteCombined: MTLResourceOptions!
    }
    public class MTLSize {
        public var width: Int!
        public var height: Int!
        public var depth: Int!
        public init() {}
        public init(width: Int, height: Int, depth: Int) {}
    }
    public func MTLSizeMake(_ width: Int, _ height: Int, _ depth: Int) -> MTLSize {
        return MTLSize()
    }
    public class MTLTexture {
        public var width: Int!
        public var height: Int!
        public var depth: Int!
        open var arrayLength: Int!
    }
    public class MTLTextureType {}
    public class MTLTextureUsage {}
#endif
