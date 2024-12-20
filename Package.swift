// swift-tools-version: 5.10
import PackageDescription

let GX_FC_LAST_VERSION = Version("2.2.0-beta")

let package = Package(
	name: "OneSignalNotificationsProvider",
	platforms: [.iOS(.v15)],
	products: [
		.library(name: "OneSignalNotificationProvider", targets: ["OneSignalNotificationProvider"]),
		.library(name: "OneSignalNotificationServiceExtension", targets: ["OneSignalNotificationServiceExtension"]),
	],
	dependencies: [
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreBL.git", .upToNextMajor(from: GX_FC_LAST_VERSION)),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreModule_SD_Notifications.git", .upToNextMajor(from: GX_FC_LAST_VERSION)),
		.package(url: "https://github.com/OneSignal/OneSignal-XCFramework", .upToNextMajor(from: "5.2.9"))
	],
	targets: [
		.target(name: "OneSignalNotificationProvider",
				dependencies: [
					.product(name: "GXCoreBL", package: "GXCoreBL"),
					.product(name: "GXCoreModule_SD_Notifications", package: "GXCoreModule_SD_Notifications"),
					.product(name: "OneSignalFramework", package: "OneSignal-XCFramework"),
				],
				path: "Sources/NotificationsProvider"),
		.target(name: "OneSignalNotificationServiceExtension",
				dependencies: [
					.product(name: "OneSignalExtension", package: "OneSignal-XCFramework"),
				],
				path: "Sources/NotificationsServiceExtension"),
	]
)
