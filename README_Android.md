# Zync Android SDK 
*Looking for? [iOS SDK Documentation](README.md)*

Video Playback SDK for no DRM and Widevine content. Note that Widevine content can only be played on a real device.

## Requirements

- Android Studio 4.0+
- Android SDK 21.0+

## **Step 1:** Install ZyncSDK

1. Drag-and-drop the ZyncSDK.jar folder into your project.
2. Open your `app/build.gradle` project file
3. Add jar into your gradle dependencies

### Gradle


```#groovy
dependencies {
    // Add the Zync Android SDK
    implementation 'com.zync.android:sdk(insert latest version)'
}
```

## **Step 2:** Initializing the Zync SDK

A valid `Zync API key` is required to use the SDK. Obtain an API key from your Zync contact and pass this value into the Zync SDK initalization. 

Java: `eg. ZyncSDK zyncSDK = new ZyncSDK("<api-key>");`
Kotlin: `eg . val zyncSDK = ZyncSDK("<api-key>")`


## **Step 3:** Using the Zync SDK Player

```kotlin

// Import the parts needed by the SDK
import com.zync.android.sdk
import com.zync.android.sdk.browse

class MainActivity : AppCompatActivity() {

  private lateinit var zyncSDK: ZyncSDK

  override fun onCreate(savedInstanceState: Bundle?) {
      super.onCreate(savedInstanceState)

      // Set up the zyncSDK with API key
      zyncSDK = ZyncSDK("<api-key>")
      launchBrowse()
  }
  
  private fun launchBrowse() {
    Browse.launch(zyncSDK)
  }
  
}
```

## **Step 4:** Build and run

Select `_Run` -> `Run App_` in the menu bar.

## API

### URL Properties

Stream URL: (ie: "https://xyz.com/WithWidevineDRM/stream.mpd")
The URL to the media content playlist. 

Widevine URL: (ie: "https://xyz.com/proxy?pX=E355B9")
The URL to the Widevine license server.


## createZyncPlayer

Creates a Zync player that can play either Widevine content or non DRM content.

### Example - Widevine w/ Zync Stream

```kotlin
ZyncPlayer.launchWidevine(zyncSDK, streamURL)
```

### Example - Widevine with non-Zync Stream

```kotlin
ZyncPlayer.launch(zyncSDK, streamURL, widevineURL)
```

### Example - Non DRM

```kotlin
ZyncPlayer.launch(zyncSDK, streamURL)
```

## launchBrowse

Launches the Browse Playlist experience

```kotlin
Browse.launch(zyncSDK)
```


