Interlude
=========

Interlude is a simple webservice for counting click-throughs and
other events for URLs.

Usage
-----

### Set

Increments the count for the given url/action pair.

The default value of `action` is "redirect", but you can specify any value. The
redirect action will redirect to the given URL, while any other action will
simply respond with a 200.

```sh
https://interlude.herokuapp.com/set?url=http://google.com
https://interlude.herokuapp.com/set?url=http://example.com&action=upvote
https://interlude.herokuapp.com/set?url=http://example.com&action=downvote
```

### Get

Returns a JSON response with a count for the given url/action pair.

```sh
https://interlude.herokuapp.com/get?url=http://google.com
```

Dev
---

```sh
npm install
foreman start
```