# HTTP

> **H**yper**t**ext **T**ransfer **P**rotocol
>
> HTTP is the standardized protocol used to transmit data over the world wide web.
>
> Invented in the 1980's by Tim Berners-Lee

HTTP is the foundation of any data communication for the world wide web.

It's a protocol, a set of rules, for how two devices can exchange data - or rather **request** and **respond** (send) data.



###Overview

The internet is at the end of the day just computers connected to one another. When enter an URL into the adress bar in your browser - your computer (or rather - browser) will act as the **client** sending a *request*  to another computer acting as a **server**. The server will look at the request and, if the request is valid, then send a *response* back to the client (your computer).

**HTTP sets the rules for *how*** a device should send a request, and for *h*ow a response should be sent back. It's basically an agreement on a set of rules of how machines communicate with each other.

The operation taking place is called a **"request-response cycle"**.

**In the beginning the HTTP protocol returned *only* html document**, but has since evolved into something bigger, returning images, videos and css, html and javascript documents etc.



### IP

The internet consist of millions of interconnected devices. By convention, all devices that participate in a network are *provided* with a **unique adress**. This adress is called an IP Address - an **I**nternet **P**rotocol Address, and can easily be compared to a phone number.

Furthermore an IP Address have **port numbers**, that add more detail about how to communicate.

IP Addresses are represented by 4 numbers seperated by a dot:

```ruby
192.168.0.1 # No port number
192.168.0.1:1234 # With a port number (1234)
```

For a device to access the wider internet, it should have a public IP address provided by an **I**nternet **S**ervice **P**rovider - much like you would want to have your phone number made public in a phone book for others to be able to contact you back in the day.



### DNS

