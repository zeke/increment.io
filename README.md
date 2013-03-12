<h1 style="font-size:42px;font-family:monaco,consolas,courier,monospace; color:black;">increment<span style="color:#CCC">.io</span></h1>

A simple webservice for counting click-throughs and
other events for URLs.

## Usage

### Incrementing

To increment the count for a URL, pass `url` and optionally `action` to the base
path as query params. The default action is `redirect`, but you can specify any value you want. The
redirect action will redirect to the given URL, while any other action will
return a JSON object with the updated count.

- [increment.io?url=http://google.com](http://increment.io?url=http://google.com)
- [increment.io?url=http://zeke.sikelianos.com&action=upvote](http://increment.io?url=http://zeke.sikelianos.com&action=upvote)
- [increment.io?url=http://zeke.sikelianos.com&action=downvote](http://increment.io?url=http://zeke.sikelianos.com&action=downvote)

### Getting Counts

[/get?url=http://google.com](http://increment.io/get?url=http://google.com)

```js
{
  action: "redirect",
  url: "http://google.com",
  count: 5
}
```

[/get?url=http://zeke.sikelianos.com&action=upvote](http://increment.io/get?url=http://zeke.sikelianos.com&action=upvote)

```js
{
  action: "upvote",
  url: "http://zeke.sikelianos.com",
  count: 22
}
```

## Development

```sh
npm install
foreman start
```

## License

MIT