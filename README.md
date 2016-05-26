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
### Query
Let's assume, we have the id of an article and we want to have the `headline`, `body` text and `opener image` of that article.

Our graphQL query for that will look like this:

```graphQL
query {
	test: content(id: 153082687){
		...contentFields
	}
}
fragment contentFields on Content {
	headline,
	body,
	image(role: "opener", enum: [this, that]){
		...imageContent
	}
}
fragment imageContent on Image {
	id
	url
}
fragment urlFragment on Image {
	 url (ratio: 1, size: 200) 
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
**Note:** Argument values that are of type String, are automatically represented with quotes.	
**GraphQL** also gives us the possibility to have custom enums as argument values. All you have to do, is letting your enum implement ArgumentValue and you're good to go.

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

```swift
let imageContentRequest = ReadingRequest(
	name: "image",
	arguments: [
		Argument(key: "role", value: "opener"),
		customEnumArgument
	],
	fields: [
		imageContent
	]
)
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
let query = Query(readingRequest: ReadingRequest(
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
### Mutation
Let's assume, we want to change our username and our age in our backend and we want to have the new name and age back to make sure everything went right.

Let's assume further, our server provides a mutating method `editMe` for exactly that purpose.

Our graphQL query for that will look like this:

```graphQL
mutation myMutation {
	editMe(input: {
		name: "joe",
		age: 99
	})
	{
		name,
		age
	}
}
```
Let us first create the actual mutating function. We can use a `MutatingRequest` for that. As `Argument` `values` we give information about which fields should be changed and what's the actual change

```swift
let mutatingRequest = MutatingRequest(
	mutationName: "editMe",
	mutationArgument:
		Argument(
			key: "input",
          values: [
				Value(withFields: [
					MutatingField(key: "name", value: "joe"),
					MutatingField(key: "age", value: 99)
					]
				)
			]
		),
	responseFields: [
		"name",
		"age"
	]
)
```

We can then use a normal `Query` for that. The only difference is: We have to tell the query, that it will be a `Mutation`

```swift
let mutation = Mutation(
	withAlias: "myMutation",
	mutatingRequest: mutatingRequest
)
```

After we've done that we can create the request.

```swift
print(mutation.create())
```

## Authors
`GraphQLicious` was made in-house by WeltN24

### Contributors
Felix Dietz, [felix.dietz@weltn24.de](mailto:felix.dietz@weltn24.de), [@joemcbomb](https://github.com/joemcbomb) on Github, [@joemcbomb](https://twitter.com/joemcbomb) on Twitter

Vittorio Monaco, [vittorio.monaco@weltn24.de](mailto:vittorio.monaco@weltn24.de), [@vittoriom](https://github.com/vittoriom) on Github, [@Vittorio_Monaco](https://twitter.com/Vittorio_Monaco) on Twitter

## License
`GraphQLicious` is available under the MIT license. See the LICENSE files for more info.