# TEST PREP NETWORK FO

## Test Study Guide

You should have a good understanding of the following topics before continuing on to take the assessment.

- <font style='color:#0074d9'><b>text</b></font>
- <font style='color:#7fff00'><b>green text</b></font>

## **The Internet**

- Have a broad understanding of what the internet is and how it works
  - <font style='color:#0074d9'><b>The internet is a vast *network of networks*. It is comprised of both the *network infrastructure* itself (devices, routers, switches, cables, etc) and the *protocols* that enable that infrastructure to function ie communicate with each other.</b></font>
  - <font style='color:#0074d9'><b>Protocols are *systems of rules*. Network protocols are systems of rules governing the exchange or transmission of data over a network.</b></font>
  - <font style='color:#0074d9'><b>Different types of protocol are concerned with different aspects of network communication. It can be useful to think of these different protocols as operating at particular 'layers' of the network.</b></font>
  - <font style='color:#0074d9'><b>*Encapsulation* is a means by which protocols at different network layers can work together.</b></font>
  - <font style='color:#0074d9'><b>Encapsulation is implemented through the use of *Protocol Data Units* (PDUs). The PDU of a protocol at one layer, becomes the data payload of the PDU of a protocol at a lower layer.</b></font>
  - <font style='color:#7fff00'><b>The internet is a network of networks, its components are that hardware itself ie cables, routers, switches, clients, servers and the protocols that allow communication between those elements.</b></font>
  - <font style='color:#7fff00'><b>Network protocols are systems of rules that control the exchange or transmission of data on the network and different protocols deal with different aspects of communication ie "layer".</b></font>
  - <font style='color:#7fff00'><b>Encapsulation allows protocols from different layers to interact with each other by using PDU or Protocol Data Units. The PDU of one layer becomes the data payload of the PDU of the layer below.</b></font>
    - <font style='color:#7fff00'><b>Application/Application - HTML - request/response</b></font>
    - <font style='color:#7fff00'><b>Transport/Transport - TCP: segment /UDP: datagram</b></font>
    - <font style='color:#7fff00'><b>Internet/Network - internet - packet</b></font>
    - <font style='color:#7fff00'><b>Link/Datalink - ethernet - frame</b></font>
- Understand the characteristics of the physical network, such as latency and bandwidth
  - <font style='color:#0074d9'><b>The *physical network* is the tangible infrastructure that transmits the electrical signals, light, and radio waves which carry network communications.</b></font>
  - <font style='color:#0074d9'><b>The phyical compononets are limited by physical laws as a result they impose limits</b></font>
    - <font style='color:#0074d9'><b>Latency: Is a measure of delay, The amount of time to send a small packet of data </b></font>
    - <font style='color:#0074d9'><b>Bandwidth: Is the measure of capacity, The amount of data sent per a unit of time</b></font>
- Have a basic understanding of how lower level protocols operate
  - <font style='color:#0074d9'><b>Ethernet Protocol: The protocols that enable communications between devices on a local network.</b></font>
    - <font style='color:#0074d9'><b>MAC Addresses enable that communication because it identifies each device connected to the local network with a unique ID assigned during manufacturing. </b></font>
    - <font style='color:#0074d9'><b>Example: My laptop connecting to my desktop so I can play the music on my laptop that is stored on the desktop </b></font>
- Know what an IP address is and what a port number is
  - <font style='color:#0074d9'><b>An IP address is a device unqiue address on the internet</b></font>
  - <font style='color:#0074d9'><b>A Port number is an additional number appended to an IP address, it allows for a direct connection to a client and server and allows the client to have multiple connections concurrently.</b></font>
  - <font style='color:#0074d9'><b>The *Internet Protocol* (IP) is the predominant protocol used for *inter-network communication*.There are two versions of IP currently in use: IPv4 and IPv6.</b></font>
  - <font style='color:#0074d9'><b>The *Internet Protocol* uses a system of addressing (IP Addressing) to *direct data between one device and another across networks*.</b></font>
- Have an understanding of how DNS works
  - <font style='color:#0074d9'><b>The Domain Name System is a system that translates a URL from human readable syntax to an IP addresses</b></font>
- Understand the client-server model of web interactions, and the role of HTTP as a protocol within that model
  - <font style='color:#0074d9'><b>The client-server model of web interaction typically is accomplished using HTTP with a request/response system where a client request data ie a webpage and the server response by supplying the requested data.</b></font>
  - <font style='color:#0074d9'><b>There is also a layer of security inherent in HTML</b></font>
  - <font style='color:#0074d9'><b>HTML provides structures/rules to the client-server interaction first is the hand shake </b></font> 

## **TCP & UDP**

### Have a clear understanding of the TCP and UDP protocols, their similarities and differences.

- <font style='color:#7fff00'><b>TCP provides the abstraction of a reliable network on top of an unreliable channel</b></font>

- <font style='color:#7fff00'><b>Transmission Control Protocol offers quite a few benefits.</b></font> 

  - <font style='color:#7fff00'><b>Three Way handshake:</b></font>
    - <font style='color:#7fff00'><b>Establishes a connection comprised of three parts</b></font>
      - SYN
      - SYS ACK
      - ACK
  - <font style='color:#7fff00'><b>Multiplexing: (through the use of Ports)</b></font> 
    - <font style='color:#7fff00'><b>the transmission of multiple signals over a single channel ie communication from client to multiple</b></font>
  - <font style='color:#7fff00'><b>Demultiplexing:</b></font>
    - <font style='color:#7fff00'><b>Is the reverse of multiplexing, where multiple signals converge to one channel</b></font>
  - <font style='color:#7fff00'><b>Port:</b></font>
    - <font style='color:#7fff00'><b>Is an ID comprised of numbers appended to an IP address for a specfic process running on a host device. Ports are includes in TCP PDU segments to identify the source and destination to direct data to a specific process.</b></font>
  - <font style='color:#7fff00'><b>Socket:</b></font>
    - <font style='color:#7fff00'><b>The word socket has differente meanings depending in the context used.</b></font>
    - <font style='color:#7fff00'><b>TCP/IP socket: is a combination of an IP address and port number which indentifies an communication end-point.(usually on different machines) </b></font>
    - <font style='color:#7fff00'><b>As a programming object socket <><><><<><<><</b></font>
  - <font style='color:#7fff00'><b>Connection oriented communication:</b></font>
    - <font style='color:#7fff00'><b>a socket object defined by the IP address and port assigned to the process is created and calls a `listen()` method which waits for incoming messages directed to that ip:port. Once a message is received another socket object is created which creates a direct connection with the source ip:port</b></font>
    - Why is this important
      - it create another level of reliability
  - <font style='color:#7fff00'><b>Sequencing and Retransmission </b></font>
    - <font style='color:#7fff00'><b>Once a connection is established data can sent and recieved. The data is broken up to be transmitted, sequencing is used to ensure the data is rebuilt in the correct order. Ie 1 of 5, 2 of 5 etc. The reciever responds saying it recieved the segment. If the segmentis not received the TCP protocol will restransmit the data segment to ensure the data set is complete.</b></font>
  - <font style='color:#7fff00'><b>Flow and Congestion Avoidance</b></font>
    - <font style='color:#7fff00'><b>The main *downsides of TCP* are the *latency overhead of establishing a connection* due to the handshake process, and the potential *Head-of-line blocking* as a result of in-order delivery.</b></font>

- <font style='color:red'><b>User Datagram Protocol</b></font>

  - <font style='color:#7fff00'><b>User Datagram Protocol is different than TCP because it does NOT offer</b></font> 
    - <font style='color:#7fff00'><b>Data Sequencing and Retransmission</b></font> 
      - <font style='color:#7fff00'><b>If data is lost, it will not be retransmissted</b></font>
    - <font style='color:#7fff00'><b>Flow Control and Congestion Avoidance</b></font>
      - <font style='color:#7fff00'><b>If the networks is inundated with data, more data can be lost</b></font>
    - <font style='color:#7fff00'><b>Connectionless oriented communication:</b></font>
      - <font style='color:#7fff00'><b>a socket object defined by the IP address and port assigned to the process is created and calls a `listen()` method which waits for incoming messages directed to that ip:port. It doesnt care about the source, the time or the order of the messages, it process the message and reponses as necessary.</b></font>
  - Why use UDP if it doesnt offer the same things as TCP? Because it doesnt offer those tools, the protocol is much simpler and faster the TCP. The developer who uses it needs to build in service they want on top of UDP and have a way to prevent overloading the network.

  ### Have a broad understanding of the three way handshake and its purpose.

- <font style='color:#0074d9'><b>The three way handshake in TCP is a reduntant measure to ensure that data is transmitted incase the` data is damaged or lost enroute.</b></font>

- <font style='color:#7fff00'><b>Three Way Handshake:</b></font>

  - <font style='color:#7fff00'><b>The three way handshake is used to ensure a stable connection is made</b></font>
  - <font style='color:#7fff00'><b>The sender sends a SYN(synchronize) message (a TCP Segment with the `SYN` flag set to `1`)</b></font>
  - <font style='color:#7fff00'><b>Upon receiving this SYN message, the receiver sends back a SYN ACK message (a TCP Segment with the `SYN` and `ACK` flags set to `1`)</b></font>
  - <font style='color:#7fff00'><b>Upon receiving the SYN ACK, the sender then sends an `ACK` (a TCP Segment with the `ACK` flag set to `1`)</b></font>

  <font style='color:#7fff00'><b>Upon sending the ACK, the sender can immediately start sending application data. The receiver must wait until it has received the ACK before it can send any data back to the sender. One of the main reasons for this process is to synchronise (`SYN`) the sequence numbers that will be used during the connection.</b></font>

  - <font style='color:#7fff00'><b>Once a connection is made, data is sent to the receiver in is numbered to keep track of all the data. The reciever responsed saying it received the data segment. If not acknowledgment is recieve the sender will restransmit the missing data segment.</b></font>
  - <font style='color:#7fff00'><b>Non-pipelined data:</b></font>
    - <font style='color:#7fff00'><b>the sender wait for the acknowledgment before sending more data. Its a slow process.</b></font>
  - <font style='color:#7fff00'><b>Pipelined data:</b></font>
    - <font style='color:#7fff00'><b>the sender send multiple data segement before waiting for a response. This greatly decreases the </b></font>

### Have a broad understanding of flow control and congestion avoidance

- <font style='color:#7fff00'><b>Flow control</b></font>
  - <font style='color:#7fff00'><b>Is a mechanism to prevent the sender from overwhelming the receiver with too much data at once. The receiver is only able to process a certain amount of data. Data awaiting processing is store in a buffer. The TCP header contains a field which lets the sender know how much data to send in a segments. The field can be updated to decrease/increase the data amount based on the receiver status. Flow Control doesn't prevent either the sender or receiver from overwhelming the underlying network ie think of it as too much data to be processed. A different mechanism handles that ie Congestion Avoidance.</b></font>
- <font style='color:#7fff00'><b>Congestion Avoidance</b></font>
  - <font style='color:#7fff00'><b>Is a situation that occurs when there is more data being transmitted on the network than there is network capacity to process and transmit the data. Excess data is stored in a buffer, if the buffer capcity is exceed the excess data is dropped. If too much data is dropped, then the protcol can reduce the data size to smaller sizes. </b></font>

## URLs

- Be able to identify the components of a URL, including query strings
  - <font style='color:#7fff00'><b>Scheme</b></font>
  - <font style='color:#7fff00'><b>Host</b></font>
  - <font style='color:#7fff00'><b></b></font>
  - <font style='color:#7fff00'><b>path</b></font>
  - <font style='color:#7fff00'><b>Flow control</b></font>
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