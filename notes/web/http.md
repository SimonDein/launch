# HTTP

> **H**yper**t**ext **T**ransfer **P**rotocol
>
> HTTP is the standardized protocol used to transmit data over the world wide web.
>

It's a protocol, a set of rules, for how two devices can exchange data - or rather **request** and **respond** (send) data.

###Overview

The internet is at the end of the day just computers connected to one another. When you enter an URL into the adress bar in your browser - your computer (or rather - browser) will act as the **client** sending a *request*  to another computer acting as a **server**. The server will look at the request and, process it and then send a *response* back to the client (your computer).

**HTTP sets the rules for *how*** a device should send a request, and for *h*ow a response should be sent back. It's basically an agreement on a set of rules of how machines communicate with each other.

The operation taking place is called a **"request-response cycle"**.

**In the beginning the HTTP protocol returned *only* html document**, but has since evolved into something bigger, returning images, videos and css, html and javascript documents etc.



## HTTP Request

HTTP is strictly a **text-based protocol** (Meaning requests and responses can be read by humans)

A request must contain certain details - while others are optional:

* Implicitly contains the protocol (fx. HTTP/1.1.)


* Must consist of the **host** (since HTTP 1.1), a **path** and **method**
  * Host consist of the domain name (google.com)
  * Path is the path the file requested (…/index.html)
  * Method is the method by which we want to connect with the server (GET / POST / DELETE etc.)
* Can **also** consist of **parameters**, **header** and a **body**

### Request Methods

The method specifies the kind of request that is sent.

- **GET** requests are used for retrieving data, e.g. asking for the representation of a specified resource. They are restricted with respect to length and data type (ASCII character set).
- **POST** requests are used for submitting data to the server (as part of the request body), and for initializing an action on the server, such as updating an existing resource or creating a new one. They are not restricted with respect to length and data type.
- **HEAD** only asks for the header of a response, e.g. for checking the response status code without actually transferring the resource, in order to check whether the resource exists or has been modified or moved. This can be relevant for caching purposes.

A request is *safe* if it does not request any action besides the retrieval of data. E.g. GET, HEAD. Not POST, PUT, DELETE.

A request is *idempotent* if the result is the same no matter how often it is executed (aside from errors or expiration effects). E.g. GET, HEAD, DELETE. Not POST.

### Examples

```
GET /about/authors HTTP/1.1 (method, path and protocol)
-------------------
Host: example.com (header section)
User-Agent: ...
-------------------
```

In case of a POST request sending data to the server, this data is sent as the request body:

```
POST /user HTTP/1.1	(method, path and protocol)
-------------------
Host: example.com	(header section)
User-Agent: ...
-------------------
first_name=alice&action=update (body - data sent to the server will be here)
```



## Responses

The server validates the response, retrieves the data (if valid request) and sends a response by either sending the requesting resource or a response indicating an initialized action or error that occurred.

* Implicitly contains the protocol (fx. HTTP/1.1)


* A response **must** include a **status**
* May also include **headers** or a **body**

### Example

```txt
HTTP/1.x 200 OK (protcol and status code)
--------------- (Header section)
Last-Modified: ...
---------------
```

```
HTTP/1.x 303 See other (protocol and status code)
--------------- (header section)
Location: ...
---------------
```

### Status codes

#### 100s: Informational

#### 200s: Successful

- `200` Ok
- `204` Success, no content

#### 300s: Redirections

- `301` Moved permanently (future requests should use new URL)
- `302` Moved temporarily (future requests should use old URL)
- `303` See other

Redirects provide the new URL as HTTP header `Location`.

`Moved` is used when the location of a requested resource was changed.

`See other` is mainly used for responses to POST requests, with the aim of directing the user to the resource that was created or updated by the request. In HTTP/1.1, the expected behavior is that the client sends a GET request to the new URL. (This was also the expected behavior for `302` in HTTP/1.0.)

#### 400s: Client error (problem with request)

- `400` Bad request (i.e. malformed)
- `401` Unauthorized (i.e. client needs to authenticate before having access to the resource)
- `403` Forbidden
- `404` Requested resource was not found
- `408` Request timeout
- `410` Gone (similar to `404`, but saying that the resource used to be there but was removed)

#### 500s: Server error

- `500` Internal server error
- `501` Not implemented (e.g. if a particular HTTP method is not supported)
- `505` HTTP version not supported



## URLs

> A Uniform Resource Identifier (URI) is a compact string of characters for identifying an abstract or physical resource. -- <https://www.ietf.org/rfc/rfc2396.txt>

```
url = scheme "://" host [ ":" port ] [ path [ "#" anchor ] [ "?" query ]]
```

The `scheme` specifies a protocol, telling how the resource can be accessed, e.g. `http`, `https`, `ftp`, `mailto`, `git`.

The `host` is either a hostname (e.g. `example.com`) or an IP address.

**Example:**

```
https://example.com:3000/character?first_name=elaine&last_name=marley
```

Default `port`s:

- `80` for HTTP
- `443` for HTTPS

The allowed characters in a URL are a subset of the ASCII character set. ASCII characters not in this set (*unsafe*, e.g. `%`) as well as reserved characters (`;`, `/`, `?`, `:`, `@`, `&`, `=`, `+`, `$`, `,`) need to be encoded as `%xx` where `xx` are two hexadecimal digits representing the ASCII code of the character (e.g. `%20` for space).



## HTTP communication

1. The **client**

- extracts the host name from the URL
- gets the IP address for that host name (from a DNS - Domain Name Server)
- gets the port number (either specified in URL or the default - port `80`)

1. The **client** opens a TCP/IP connection to the IP address with the port
2. The **client** sends an HTTP request to the **server**
3. The **server**

- processes the request
- accesses the required resources
- composes and sends an HTTP response
- usually also logs the transaction

1. The **client** receives the response and processes and displays the data accordingly
2. The client or server closes the connection

HTTP also allows for a chain of HTTP intermediaries between client and server (proxies, caches, etc).



## IP

The internet consist of millions of interconnected devices. By convention, all devices that participate in a network are *provided* with a **unique adress**. This adress is called an IP Address - an **I**nternet **P**rotocol Address, and can easily be compared to a phone number.

Furthermore an IP Address have **port numbers**, that add more detail about how to communicate.

IP Addresses are represented by 4 numbers seperated by a dot:

```ruby
192.168.0.1 # No port number
192.168.0.1:1234 # With a port number (1234)
```

For a device to access the wider internet, it should have a public IP address provided by an **I**nternet **S**ervice **P**rovider - much like you would want to have your phone number made public in a phone book for others to be able to contact you back in the day.
