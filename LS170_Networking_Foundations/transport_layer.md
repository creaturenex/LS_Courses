# The Transport Layer

**What are the main takeaways?**
- Learn how transport layer protocols enable communication between processes
- Learn that network reliability is engineered
- Understand the trade-offs

## Communication Between Processes
The Internet Protocol provides the bare minimum to have inter-network
communication. But modern applications have higher requirements than what IP
provides. ie direct connections between applications and reliable network
communication. Remember that a host device can be running multiple applications
at once.

### Multiplexing and Demultiplexing
Think of your typical computer usage, listening to music on Spotify, while playing
a video game on Blizzard, and having Discord running on another screen.

**Multiplexing** is having a host device communicating to multiple remote servers
concurrently through separate channels.

**Demultiplexing** is the reverse process ie multiple remote server communicating
to a host device.

### Network Ports
Multiplexing and Demultiplexing takes place using network ports. In simple terms
a port is an identifier for a specific process running on a host. This identifier
is an integer in the range 0-65535. Sections of this range are reserved for
specific purposes:

- 0-1023 are well-known ports. These are assigned to processes that provide
commonly used network services. For example HTTP is port 80, FTP is port 20 and
21, SMTP is port 25, and so on.
- 1024-49151 are registered ports. They are assigned as requested by private
entities. For example, companies such as Microsoft, IBM, and Cisco have ports
assigned that they use to provide specific services. On some operating systems,
ports in this range are also used for allocation as ephemeral ports on the client
side.
- 49152-65535 are dynamic ports (sometimes known as private ports). Ports in this
range cannot be registered for a specific use. They can be used for customized
services or for allocation as ephemeral ports.

**The Transport Layer uses several PDU's who's exact name and structure varies based on the specific protocol used. But all the PDU's share the following information. The Source and Destination Port ID**

Ports separates the incoming/outgoing data to the host device and to the appropriate application.

### Sockets
```ruby
# This linux command returns a list of connections on your computer.
netstat -ntup

=>
# This is an example of the source/destination IP address and port.
Proto Recv-Q Send-Q Local Address           Foreign Address         State       PID/Program name
tcp        0      0 172.16.0.66:38880       172.217.169.36:443      ESTABLISHED 4180/chrome --type=
tcp        1      0 172.16.0.66:53458       3.81.154.63:443         CLOSE_WAIT  3118/dropbox
tcp        0      0 172.16.0.66:52638       216.58.208.170:443      ESTABLISHED 4180/chrome --type=
tcp       32      0 172.16.0.66:34320       162.125.64.7:443        CLOSE_WAIT  3118/dropbox
```

The terminology around sockets can be confusing, since this term is used in slightly different ways depending on the context. At a conceptual level a socket is, as outlined above, an abstraction for an endpoint used for inter-process communication. At an implementation level it can be used to refer to different specific things:
- UNIX socket: a mechanism for communication between local processes running on
  the same machine.
- Internet sockets (such as a TCP/IP socket): a mechanism for inter-process
  communication between networked processes (usually on different machines).

At a conceptual level a socket is a communication end-point defined by an address-port pair.

In socket programming or network programming terms though, the implementation of
this concept involves instantiating socket objects. While implementations vary,
many follow the Berkley sockets API model. Implementations which follow this
model define specific functions such as bind(), listen(), accept(), and connect
(), among others.

Having a mental model of sockets being implemented as objects helps to understand
how they can be used to create connections between applications. Some
understanding of connections is necessary to comprehend the difference between
connection-oriented communication and connectionless communication. The
difference between these communication modes is an important factor in
understanding the differences between the TCP and UDP protocols, which we'll look
at in more detail later in this lesson.

### Sockets and Connections

**Connection Communication** only has one socket object that *listens* to any incoming messages from any number of remote devices/application.

**Connectionless Communication** has multiple instance of a socket object and creates a direct connection with the remote device/application.

Depending on the type of communication required, either method is a valid practice. This is an additional communication rules allows for more reliable communication.

## Network Reliability
Protocol communication from the Ethernet level up to the Network level has inherently is unreliable, data will be dropped if it corrupted during it travel and there is no mechanism to request the dropped data.

### Building a Reliable Protocol

**Problem 1**</br>
First issue, data can be corrupted or lost.

**Solution**</br>
Use an acknowledgement message.

**Possible Problems**</br>
- The recipient might never get a message so it will not send a acknowledgement.
- The acknowledgement might itself be corrupted or lost!

**Problem 2**</br>
What if the acknowledgement is not received?

**Solution**</br>
Re-send the message if acknowledgement not received within a certain time-frame.

**Possible Problems**</br>
- Sender sends one message at a time, and sets a timeout
- If message received, receiver sends an acknowledgement
- When acknowledgement is received, sender sends next message
- If acknowledgement not received before the timeout expires, sender assumes either the message or the acknowledgement went missing and sends the same message again

**Problem 2**</br>
What if the acknowledgement is not received?

**Solution**</br>
Re-send the message if acknowledgement not received within a certain time-frame.

**Possible Problems**</br>
- Sender sends one message at a time, and sets a timeout
- If message received, receiver sends an acknowledgement
- When acknowledgement is received, sender sends next message
- If acknowledgement not received before the timeout expires, sender assumes either the message or the acknowledgement went missing and sends the same message again
