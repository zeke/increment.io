Interlude
=========

Interlude is a simple webservice for counting click-throughs and
other events for URLs.

Usage
-----

### Set

Increments the count for the given url/action pair.

The default action is "redirect", but you can specify any value. The
redirect action will redirect to the given URL, while any other action will
return a JSON object with the updated count.

- [/set?url=http://google.com](https://interlude.herokuapp.com/set?url=http://google.com)
- [/set?url=http://zeke.sikelianos.com&action=upvote](https://interlude.herokuapp.com/set?url=http://zeke.sikelianos.com&action=upvote)
- [/set?url=http://zeke.sikelianos.com&action=downvote](https://interlude.herokuapp.com/set?url=http://zeke.sikelianos.com&action=downvote)

### Get

Returns a JSON response with a count for the given url/action pair.

[/get?url=http://google.com](https://interlude.herokuapp.com/get?url=http://google.com)

```js
{
  action: "redirect",
  url: "http://google.com",
  count: 5
}
```

[/get?url=http://zeke.sikelianos.com&action=upvote](https://interlude.herokuapp.com/get?url=http://zeke.sikelianos.com&action=upvote)

```js
{
  action: "upvote",
  url: "http://zeke.sikelianos.com",
  count: 22
}
```

Dev
---

```sh
npm install
foreman start
```