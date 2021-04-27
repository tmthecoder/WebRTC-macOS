## WebRTC-macOS

A WebRTC port for macOS consisting of a universal library for x86 and arm (Intel and Apple Silicon)

## Installation

To Install this library, you can use the `WebRTC.framework` attached in the releases section

Alternatively, you can use CocoaPods with the following addition to your podfile:

```
pod 'WebRTC-macOS', :git => 'https://github.com/tmthecoder/WebRTC-macOS.git', :tag => '8324'
```

## Usage

The guides on the WebRTC example may be followed with all functionality present.

All you need to do is add the import statement to use for Swift:

``` 
import WebRTC
```

## Building
To Build your own WebRTC Framework, similar to the one I have build,
the instructions are as follows:

Clone the WebRTC Source:

```
git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git
export PATH=$PATH:/path/to/depot_tools

fetch --nohooks webrtc_ios

gclient sync
```

Generate the macOS Targets (x86_64 and arm64)

```
gn gen out/mac_x64 --args='target_os="mac" target_cpu="x64" is_component_build=false is_debug=false rtc_libvpx_build_vp9=false enable_stripping=true rtc_enable_protobuf=false'

gn gen out/mac_arm64 --args='target_os="mac" target_cpu="arm64" is_component_build=false is_debug=false rtc_libvpx_build_vp9=false enable_stripping=true rtc_enable_protobuf=false'

```

Build both frameworks:

```
ninja -C out/mac_x64 mac_framework_objc

ninja -C out/mac_arm64 mac_framework_objc
```

Merge the frameworks using `lipo`:

```
cd ..

cp -R src/out/mac_x64/WebRTC.framrwork WebRTC.framework

lipo -create -output WebRTC.framework/WebRTC src/out/macos_x64/WebRTC.framework/WebRTC src/out/macos_arm64/WebRTC.framework/WebRTC
```
The outputted `WebRTC.franework` can be imported into an Xcode Project and will support both Intel and Apple Silicon Macs

## Licensing

- This port of WebRTC, and any changes that maybe made by me will fall under the [MIT License](https://github.com/tmthecoder/WebRTC-macOS/blob/main/LICENSE)

- WebRTC's license can be found [here](https://github.com/tmthecoder/WebRTC-macOS/blob/main/LICENSE)
