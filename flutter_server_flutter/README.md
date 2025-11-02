# CozyTemp

A Flutter temperature monitoring application built with Serverpod.

## Getting Started

This project is a Flutter application that is using Serverpod for backend services.

To run the project in development mode, first make sure that the server is running, then do:

    flutter run

## Release Builds

### Prerequisites

Before building for release, ensure you have:
1. Placed your logo PNG file at `assets/icon/logo.png`
2. Run `dart run flutter_launcher_icons` to generate all platform icons
3. Know your server URL (e.g., `https://your-server.com/` or `http://192.168.1.100:8080/`)

### Server URL Configuration

All release builds require the `SERVER_URL` to be specified at build time using `--dart-define`. This compiles the server URL directly into the app.

**Replace `YOUR_SERVER_URL` with your actual server address in all commands below.**

Examples:
- Local network: `http://192.168.1.100:8080/`
- Production server: `https://api.cozytemp.com/`

### Android Release Build

Build an APK for direct installation on Android devices:

```bash
flutter build apk --release --dart-define=SERVER_URL=YOUR_SERVER_URL
```

Example:
```bash
flutter build apk --release --dart-define=SERVER_URL=https://api.cozytemp.com/
```

The output APK will be located at: `build/app/outputs/flutter-apk/app-release.apk`

Alternatively, build an App Bundle (for Play Store distribution, if needed later):

```bash
flutter build appbundle --release --dart-define=SERVER_URL=YOUR_SERVER_URL
```

The output bundle will be located at: `build/app/outputs/bundle/release/app-release.aab`

**Installation:**
1. Transfer the APK to your Android device
2. Enable "Install from Unknown Sources" in device settings
3. Open the APK file to install

### Linux Release Build

Build a release bundle for Linux:

```bash
flutter build linux --release --dart-define=SERVER_URL=YOUR_SERVER_URL
```

Example:
```bash
flutter build linux --release --dart-define=SERVER_URL=http://192.168.1.100:8080/
```

The output will be located at: `build/linux/x64/release/bundle/`

**Installation:**
1. Copy the entire `bundle` directory to your target Linux system
2. Navigate to the bundle directory: `cd bundle`
3. Make the executable runnable: `chmod +x cozytemp`
4. Run the application: `./cozytemp`

Note: The bundle directory contains the executable and all required dependencies.

### Web Release Build

Build for web deployment:

```bash
flutter build web --release --dart-define=SERVER_URL=YOUR_SERVER_URL
```

Example:
```bash
flutter build web --release --dart-define=SERVER_URL=https://api.cozytemp.com/
```

The output will be located at: `build/web/`

**Deployment:**
Deploy the entire `build/web` directory to your web server. The app can be accessed via any modern web browser.

### Building for Multiple Configurations

If you need to build for different environments (e.g., staging vs production), you can create separate builds with different server URLs:

```bash
# Production build
flutter build apk --release --dart-define=SERVER_URL=https://api.cozytemp.com/

# Staging build  
flutter build apk --release --dart-define=SERVER_URL=https://staging.cozytemp.com/

# Local network build
flutter build apk --release --dart-define=SERVER_URL=http://192.168.1.100:8080/
```

## Version Information

Current version: 1.2.0 (Build 2)

## Additional Resources

For more information about Serverpod, visit the documentation site at:
[https://docs.serverpod.dev](https://docs.serverpod.dev)
