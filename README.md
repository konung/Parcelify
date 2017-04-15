# Parcelify

> Parcelify let you create simple yet powerful shipping rates based on address fields. Whether you'd like to create a "5$ Bike delivery" shipping rates for your neighbors, a "Free hand delivery" for your coworkers or an expensive 25$ "Plane delivery" for that remote region in your country, we've got your back.

## Table of Content

- [Documentation](#documentation)
    - [Limits](#limits)
    - [Filters](#filters)
    - [Additional cost per item](#additional-cost-per-item)
- [Installation](#installation)
- [Additional information](#additional-information)

## Documentation

### Limits

Limits are there to limit your rate to certain conditions. Use them to make sure your rate only shows up if the order is below 25kg, or above $100, or both. When specifying limits, always use the lowest unit of your currency and weight system. Cents for US, pence for UK, etc.

### Filters

Filters allow you to limit the availability of your rate based on specific conditions, such as product SKUs or address fields. They work by combining a Field, a Verb and a Value. The **field** represents the product or address field on which you'd like to apply a condition; the **verb** represents the operation with which you'd like to compare both values; the **value** represents what you'd like to test your condition against. Let's say you'd like to create a rate that applies solely to the city of Ottawa, you could add a filter that goes as follow;

- Field: City
- Verb: Equal
- Value: Ottawa

Available verbs are;

- [Equal](#equal)
- [Start with](#start-with)
- [End with](#end-with)
- [Include](#include)
- [Exclude](#exclude)
- [Regex](#regex)

##### Equal

This one is self explainatory. This evaluates if the field equals the value. As demoed in the example above, you need to match the exact value, with accents and everything.

##### Start with

This will check if the field starts with a specific value. Let's say you'd like to offer a rate to the entire Beverly Hills region, you could check if the Zip code starts with either "902" or "903".

- **Field**: Zip code
- **Verb**: Start with
- **Value**: 90(2\|3)

##### End with

Same thing as start with, but will evaluate the end of the string instead of the beginning. It supports multiple values as well.

##### Include

The include filter checks whether or not the specified value is included anywhere in the field. It doesn't matter if the value is at the start, the end or in the middle of the string. If it's there, it's good. Let's say you'd like to offer a rate for the entire Elgin street, no matter the civic number or the appartment number, or if people add "street", or "st.", you could go as follow;

- **Field**: Address line 1
- **Verb**: Include
- **Value**: Elgin

Values such as "123 Elgin Street" would then be perfectly valid.


##### Exclude

Same thing as include but... the opposite. This is mostly useful if you'd like to exclude specific items from getting your rate. Say you'd like this rate to be valid for all carts except if it contains a product with a SKU of ABC1 or DEF2, you could do;

- **Field**: SKU
- **Verb**: Exclude
- **Value**: (ABC1)\|(DEF2)

##### Regex

A regular expression is a pattern describing a certain amount of text. That makes them ideally suited for searching, text processing and data validation. Regular expressions rely on a very strict, yet powerful syntax. While it might seems hard to grasp at first, the basics are quite easy to learn.

- ^ : Start of line
- $ : End of line
- [abc]	: A single character of: a, b, or c
- [a-z] : Any single character in the range a-z
- \d : Any digit in the range of 0-9
- \s : Any whitespace characters (space, tab, etc)
- . : Any single character
- (a\|b) : a or b
- a? : Zero or one of a
- a* : Zero or more of a
- a+ : One or more of a
- a{3} : Exactly three of a

Let's say you'd like to match all Northern Ireland postcodes, you could go as follow;

- **Field**: Zip code
- **Verb**: Regular expression
- **Value**: ^BT\d{1,2}\s

Rate would then be valid for all addresses with a zip code that starts with BT, immediately followed by one or two digits, then again followed by a whitespace. [You can find more information here](http://www.regular-expressions.info/lookaround.html) and you can [test your skills here](http://rubular.com/).

### Additional cost per item

Once you have a rate setup with your conditions, you can always decide to add additional charges for specific items. Say you sell both postcards and tables, your $2.99 standard shipping might not cut it for those big, heavy items. That's where those "extras" come handy. They rely on the same field, verb, value pattern as described for filters, with the additional of a "price to add", which represents the value you'd like to add on the shipping rate if described condition is met. Let's say you'd like to add $50.00 shipping for each of those tables (sku: ABC1) in a cart, you could add an extra;

- **Field**: Product SKU
- **Verb**: Equal
- **Value**: ABC1
- **Price to add**: 5000

That way, in addition to our $2.99 standard shipping, an extra charge of $50.00 would be added for every table present in the cart.

## Installation

For regular installation, you can simply head to the [Shopify App Store](https://apps.shopify.com/parcelify) and follow regular procedures. Due to Shopify's restrictions on external shipping carriers, you'll need [a plan that support 3rd party shipping carrier](https://www.shopify.ca/pricing). If you'd like to run your own copy of this app on your own server, you can too, but you're on your own and I do not offer any help or services. It is open source with an MIT license. Feel free to clone and modify to suit your needs. It was made for Heroku but can probably run on any compatible setup. In addition to the default Heroku environement variables, you'll also need to define;

- `APPLICATION_URL`
- `SHOPIFY_CLIENT_API_KEY`
- `SHOPIFY_CLIENT_API_SECRET`

## Additional Information

### Details

- Upper and lowercase letters are considered the same
- Country codes follow the ISO 3166-1 alpha-2, 2 letters format
- State / Province codes follow the ISO 3166-2, 2 letters format

### Resources

- [Test your skills on rubular.com](http://rubular.com/)
- [View Parcelify on the Shopify App Store](https://apps.shopify.com/parcelify)
