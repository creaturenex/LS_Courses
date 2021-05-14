# Network Foundations

## Study Guide

You should have a good understanding of the following topics before continuing on to take the assessment.

## The Internet

- Have a broad understanding of what the internet is and how it works
- Understand the characteristics of the physical network, such as latency and bandwidth
- Have a basic understanding of how lower level protocols operate
- Know what an IP address is and what a port number is
- Have an understanding of how DNS works
- Understand the client-server model of web interactions, and the role of HTTP as a protocol within that model

## TCP & UDP

- Have a clear understanding of the TCP and UDP protocols, their similarities and differences
- Have a broad understanding of the three-way handshake and its purpose
- Have a broad understanding of flow control and congestion avoidance

## URLs

- Be able to identify the components of a URL, including query strings
- Be able to construct a valid URL
- Have an understanding of what URL encoding is and when it might be used

## HTTP and the Request/Response Cycle

- Be able to explain what HTTP requests and responses are, and identify the components of each
- Be able to describe the HTTP request/response cycle
- Be able to explain what status codes are, and provide examples of different status code types
- Understand what is meant by 'state' in the context of the web, and be able to explain some techniques that are used to simulate state
- Explain the difference between `GET` and `POST`, and know when to choose each

## Security

- Have an understanding of various security risks that can affect HTTP, and be able to outline measures that can be used to mitigate against these risks
- Be aware of the different services that TLS can provide, and have a broad understanding of each of those services



---------------------------------------------------------------------------------------------------------------------------------------------------------

## The Internet

### What to focus on

**Build a general picture of the network infrastructure**

Networking is a deep topic, and there's much of it that we purposely don't cover here. We don't expect you to memorize every single detail of how things work at this level, that's the domain of network engineering. As a developer or software engineer, it helps to have a high-level picture of how the underlying infrastructure functions. Much of the specific detail isn't necessary. The idea instead is to build the general mental models that will provide sufficient context to understand protocols operating at higher levels of abstraction, such as TCP and HTTP. If there's a topic that we don't mention or don't elaborate on too deeply, it's because you don't need to learn it right now.

**Be aware of the limitations of the physical network**

Higher-level protocols, such as TCP and HTTP, rely on the underlying network infrastructure in order to function. As such, they are bound by the limitations of that infrastructure, such as network bandwidth and latency. Understanding these limitations provides important context when learning about those protocols.

**Understand that protocols are systems of rules**

The protocols that support network functionality are essentially logical sets of rules that have been designed and engineered to be the way they are. Viewing them as such makes them easier to break down and contextualize.

**Learn that IP enables communication between devices**

The Internet Protocol (IP) is a key part of the functionality of the internet. Make sure to form a clear mental model of what it does.

### Summary

- The internet is a vast *network of networks*. It is comprised of both the *network infrastructure* itself (devices, routers, switches, cables, etc) and the *protocols* that enable that infrastructure to function.
- Protocols are *systems of rules*. Network protocols are systems of rules governing the exchange or transmission of data over a network.
- Different types of protocol are concerned with different aspects of network communication. It can be useful to think of these different protocols as operating at particular 'layers' of the network.
- *Encapsulation* is a means by which protocols at different network layers can work together.
- Encapsulation is implemented through the use of *Protocol Data Units* (PDUs). The PDU of a protocol at one layer, becomes the data payload of the PDU of a protocol at a lower layer.
- The *physical network* is the tangible infrastructure that transmits the electrical signals, light, and radio waves which carry network communications.
- *Latency is a measure of delay*. It indicates the amount of time it takes for data to travel from one point to another.
- *Bandwidth is a measure of capacity*. It indicates the amount of data that can be transmitted in a set period of time.
- *Ethernet* is a set of standards and protocols that enables *communication between devices on a local network*.
- Ethernet uses a Protocol Data Unit called a Frame.
- Ethernet uses *MAC addressing* to identify devices connected to the local network.
- The *Internet Protocol* (IP) is the predominant protocol used for *inter-network communication*.
- There are two versions of IP currently in use: IPv4 and IPv6.
- The *Internet Protocol* uses a system of addressing (IP Addressing) to *direct data between one device and another across networks*.
- IP uses a Protocol Data Unit called a Packet.

## The Transport Layer

### What to focus on

**Learn how transport layer protocols enable communication between processes**

Spend some time building a mental model for what multiplexing and demultiplexing are. Be clear about how ports work, along with IP addresses, to provide this functionality.

**Learn that network reliability is engineered**

It's easy to think of 'the internet' as some abstract thing that just 'works'. One of the aims of this course is to peel away some of those layers of abstraction to show that the internet and the web are actually the combination of multiple technologies that have been designed and engineered. Network reliability is one aspect of that.

**Understand the trade-offs**

As with any protocol or technology, TCP and UDP are the result of many different design decisions. Design decisions generally involve some sort of trade-off. Spend some time learning what TCP and UDP each provide, and what the trade-offs of each are.

### Summary

- *Multiplexing* and *demultiplexing* provide for the transmission of *multiple signals over a single channel*
- Multiplexing is enabled through the use of *network ports*
- Network sockets can be thought of as a *combination of IP address and port number*
- At the *implementation level*, sockets can also be *socket objects*
- The underlying network is *inherently unreliable*. If we want reliable data transport we need to implement a system of rules to enable it.
- *TCP* is a *connection-oriented* protocol. It establishes a connection using the *Three-way-handshake*
- TCP provides reliability through *message acknowledgement* and *retransmission*, and *in-order delivery*.
- TCP also provides *Flow Control* and *Congestion Avoidance*
- The main *downsides of TCP* are the *latency overhead of establishing a connection*, and the potential *Head-of-line blocking* as a result of in-order delivery.
- *UDP* is a very simple protocol compared to TCP. It provides *multiplexing*, but no reliability, no in-order delivery, and no congestion or flow control.
- *UDP* is *connectionless*, and so doesn't need to establish a connection before it starts sending data
- Although it is unreliable, the *advantage of UDP* is *speed* and *flexibility*.

## Intro to HTTP

### What to focus on

**Develop a clear understanding of the role of HTTP**

The focus of this lesson is on HTTP, however it doesn't function in isolation. As you work through the lesson, try and build a picture of the functioning of the web as a combination of multiple different technologies, a combination within which HTTP has a specific role.

**Break things down into individual components**

Ensure clarity within your mental models by breaking concepts like HTTP and URLs into specific components, and understanding the purpose of each of those components.

### Summary

- The *Domain Name System* (DNS) is a distributed database which *translates a domain name* such as `google.com` *to an IP Address* such as `216.58.213.14`.
- A *URI* is an *identifier* for a *particular* resource within an information space.
- A URL is a subset of URI, but the two terms are often used interchangeably.
- URL components include the *scheme*, *host* (or hostname), *port*, *path*, and *query string*.
- *Query strings* are used to *pass additional data* to the server during an HTTP Request. They take the form of *name/value pairs* separated by an `=` sign. Multiple name/value pairs are separated by an `&` sign. The start of the query string is indicated by a `?`.
- *URL encoding* is a technique whereby *certain characters* in a URL are *replaced with an ASCII code*.
- URL encoding is used if a character has no corresponding character in the ASCII set, is unsafe because it is used for encoding other characters, or is reserved for special use within the url.
- A single HTTP message exchange consists of a *Request* and a *Response*. The exchange generally takes place between a *Client* and a *Server*. The client sends a Request to the server and the server sends back a Response.
- An *HTTP Request* consists of a *request line*, *headers*, and an optional *body*.
- An *HTTP Response* consists of a *status line*, optional *headers*, and an optional *body*.
- *Status codes* are part of the status line in a Response. They indicate the status of the request. There are various categories of status code.
- HTTP is a *stateless* protocol. This means that each Request/ Response cycle is independent of Request and Responses that came before or those that come after.
- *Statefulness can be simulated* through techniques which use *session IDs*, *cookies*, and *AJAX*.
- HTTP is *inherently insecure*. Security can be increased by using *HTTPS*, enforcing *Same-origin policy*, and using techniques to prevent *Session Hijacking* and *Cross-site Scripting*.

## Working with HTTP

### What to focus on

**Focus on HTTP**

Although we're using bash and various network utilities in this lesson, those things aren't the primary focus here and we don't expect you to master them; we're simply using them to demonstrate how HTTP functions at a more practical level and to reinforce the concepts covered in the previous lesson. The focus of this lesson is still very much HTTP, and how it enables network communication between a client and a server.

**HTTP is concerned with the structure of messages**

At its core, HTTP is a set of rules concerned with the syntax and structure of messages exchanged between applications. Working with HTTP is ultimately about understanding what those rules mean, and knowing how and when to apply them.

**HTTP is a Request-Response protocol**

One of the fundamental aspects of HTTP is its Request-Response behavior. As you work through the lesson keep a focus on this behavior, and try to form a solid mental model around it.

### Summary

- HTTP is a text-based protocol. HTTP Request and Responses involve sending text between the client and server

- In order for the protocol to work, the Request and Response must be structured in such a way that both the client and the server can understand them.

- With HTTP/1.1, the end of the headers is indicated by an empty line.

- The Content-Length header can be used to indicate the size of the body. This can help determine where the HTTP message should end.

## Transport Layer Security

### What to focus on

**Understand that TLS provides for secure message exchange over an unsecure channel**

In learning about TLS, start from the basis of what unsecure HTTP message transfer looks like. Build on your understanding of HTTP from previous lessons in order to clearly understand what TLS adds to the mix.

**Learn that there are multiple aspects to security**

TLS provides a number of different services. Learn what each of these services provide, and the particular problems each of them aims to address.

### Summary

- HTTP Requests and Responses are transferred in plain text; as such they are essentially insecure.

- We can use the Transport Layer Security (TLS) Protocol to add security to HTTP communications.

- TLS encryption allows us to encode messages so that they can only be read by those with an authorized means of decoding the message

- TLS encryption uses a combination of Symmetric Key Encryption and Asymmetric Key Encryption. Encryption of the initial key exchange is performed asymmetrically, and subsequent communications are symmetrically encrypted.

- The TLS Handshake is the process by which a client and a server exchange encryption keys.

- The TLS Handshake must be performed before secure data exchange can begin; it involves several round-trips of latency and therefore has an impact on performance.

- A cipher suite is the agreed set of algorithms used by the client and server during the secure message exchange.

- TLS authentication is a means of verifying the identity of a participant in a message exchange.

- TLS Authentication is implemented through the use of Digital Certificates.

- Certificates are signed by a Certificate Authority, and work on the basis of a Chain of Trust which leads to one of a small group of highly trusted Root CAs.

- Certificates are exchanged during the TLS Handshake process.

- TLS Integrity provides a means of checking whether a message has been altered or interfered with in transit.

- TLS Integrity is implemented through the use of a Message Authentication Code (MAC).

## Evolution of Network Technologies

### What to focus on

**Be aware of how and why HTTP is evolving**

The modern web is very different from Tim Berners-Lee's original conception of it. An awareness of the history of HTTP, and the changes it has undergone over time, can provide us with more insight into the work-arounds used to deal with some of its limitations. This in turn can better enable us to make informed decisions when building networked applications.

**Be aware of the functionality that browser APIs can provide**

Like HTTP, the browser has evolved significantly since the early days of the web. Modern browsers provide numerous APIs that provide functionality which HTTP alone cannot. An awareness that these APIs exist and what they offer can help us when developing applications.

**Be aware that Client-Server isn't the only network paradigm**

Most of the focus of this course is on networking within a Client-Server paradigm. As an architecture it is very prevalent on the web, and it might be easy to think that this is the only architecture available to us. Being aware that other network paradigms exist can be useful when making high-level design decisions about networked applications.

### Summary

- HTTP has changed considerably over the years, and is continuing to change.

- Many of the changes to HTTP are focused on improving performance in response to the ever increasing demands of modern networked applications.

- Latency has a big impact on the performance of networked applications. As developers and software engineers we need to be aware of this impact, and try to mitigate against it through the use of various optimizations.

- In building networked applications, there are tools and techniques available to us that work around or go beyond the limitations of basic HTTP request-response functionality.

- For certain use cases a peer-to-peer architecture may be more appropriate than a client-server architecture.



