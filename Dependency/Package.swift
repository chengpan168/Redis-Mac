import PackageDescription

let package = Package(
    name: "Dependency",
	dependencies: [
		.Package(url: "https://github.com/czechboy0/Redbird.git", majorVersion: 0, minor: 10)
	]
)
