# GraphQLicious
A swift component with a DSL to declare GraphQL queries and to get string representations out of them.  
Written for `iOS 8+`, `WatchOS 2`, `tvOS` and `Mac OS X` apps.

[![CI Status](http://img.shields.io/travis/WeltN24/GraphQLicious.svg)](https://travis-ci.org/WeltN24/GraphQLicious)
[![License](https://img.shields.io/cocoapods/l/GraphQLicious.svg)](http://cocoapods.org/pods/GraphQLicious)
[![Platform](https://img.shields.io/cocoapods/p/GraphQLicious.svg)](http://cocoapods.org/pods/GraphQLicious)
[![swift2](https://img.shields.io/badge/swift2-compatible-4BC51D.svg)](https://developer.apple.com/swift)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg)](https://github.com/Carthage/Carthage)
[![Version](https://img.shields.io/cocoapods/v/GraphQLicious.svg)](http://cocoapods.org/pods/GraphQLicious)


# Contents
- [Installation] (#installation)
- [Usage] (#usage)
- [Authors] (#authors)
- [License] (#license)

## Installation
### Carthage
`GraphQLicious` supports Carthage. To install it, simply add the following line to your Cartfile

```
github "WeltN24/GraphQLicious"
```

### CocoaPods
`GraphQLicious` is available through CocoaPods. To install it, simply add the following line to your Podfile

```
pod "GraphQLicious"
```

### Submodule
If you don't use CocoaPods, you can still add `GraphQLicious` as a submodule, drag and drop `GraphQLicious.xcodeproj` into your project, and embed `GraphQLicious.framework` in your target.

- Drag `GraphQLicious.xcodeproj` to your project
- Select your app target
- Click the + button on the Embedded binaries section
- Add `GraphQLicious.framework`

### Manual
You can directly drag and drop the needed files into your project, but keep in mind that this way you won't be able to automatically get all the latest features.  
The files are contained in the `Sources` folder and work for the `iOS` framework

## Usage
Let's assume, we have the id of an article and we want to have the `headline`, `body` text and `opener image` of that article.

Our graphQL query for that will look like this:

```graphQL
{
	test: content(id: 153082687){
		...contentFields
	}
}
fragment contentFields on Content {
	headline,
	body,
	image(role: opener, enum: [this, that]){
		...imageContent
	}
}
fragment imageContent on Image {
	id,
	url
}
```

First, let's create a `Fragment` to fetch the contents of an image, namely the image `id` and the image `url`

```swift
let imageContent = Fragment(
	withAlias: "imageContent",
	name: "Image",
	fields: [
		"id",
		"url"
	]
)
```

Next, let's embed the `Fragment` into a `Request` that gets the opener image.	
**Note:** Argument values that are of type String, are automatically represented with quotes

```swift
let imageContentRequest = Request(
	name: "image",
	arguments: [
		Argument(key: "role", value: "opener")
	],
	fields: [
		imageContent
	]
)
```  

GraphQL also gives us the possibility to have custom enums as argument values. All you have to do, is letting your enum implement ArgumentValue and you're good to go.

```swift
enum customEnum: String, ArgumentValue {
  case This = "this"
  case That = "that"
  
  private var asGraphQLArgument: String {
    return rawValue // without quotes
  }
}
    
let customEnumArgument = Argument(
  key: "enum",
  values: [
    customEnum.This,
    customEnum.That
  ]
)
```	

So how do we add this argument into our request? Simple, just add it as an argument.

```swift
imageContentRequest.arguments.append(customEnumArgument)
```

So now we have a Request with an embedded Fragment. Let's go one step further.  
If we want to, we can imbed that Request into another Fragment. (We can also embed Fragments into Fragments)  
Additionally to the opener image with its id and url we also want the `headline` and `body` text of the article.

```swift
let articleContent = Fragment(
	withAlias: "contentFields",
	name: "Content",
	fields: [
		"headline",
		"body",
		imageContentRequest
	]
)
```

Finally, we put everything together as a `Query`. A Query always has a top level Request to get everything started, and requires all the Fragments that are used inside.

```swift
let query = Query(withRequest: Request(
	withAlias: "test",
	name: "content",
	arguments: [
		Argument(key: "id", values: [153082687])
	],
	fields: [
		articleContent
	]),
	fragments: [articleContent, imageContent]
)
```  

All we have to do now is to call `create()` on our Query and we're good to go.

``` 
print(query.create())
```

## Authors
`GraphQLicious` was made in-house by WeltN24

### Contributors
Felix Dietz, [felix.dietz@weltn24.de](mailto:felix.dietz@weltn24.de), [@joemcbomb](https://github.com/joemcbomb) on Github, [@joemcbomb](https://twitter.com/joemcbomb) on Twitter

Vittorio Monaco, [vittorio.monaco@weltn24.de](mailto:vittorio.monaco@weltn24.de), [@vittoriom](https://github.com/vittoriom) on Github, [@Vittorio_Monaco](https://twitter.com/Vittorio_Monaco) on Twitter

## License
`GraphQLicious` is available under the MIT license. See the LICENSE files for more info.