# How the Internet Works

> [!summary] Overview
> The **Internet** is not the World Wide Web (WWW). The internet is the underlying physical infrastructure (the hardware and wires) that allows multiple networks to communicate. The **Web**, on the other hand, is a service built on top of this infrastructure—it's the way data, web pages, and documents are arranged, accessed, and addressed.

## 1. A Simple Network
When two computers need to communicate, they must be linked physically (e.g., Ethernet cables) or wirelessly (Wi-Fi, Bluetooth). Connecting them creates a **network**. 

While a network isn't limited to just two computers, scaling a direct-connection model becomes a logistical nightmare. To connect a physical network of 10 computers where every node connects to every other node, you are essentially building a **complete graph** ($K_{10}$). 

Using the edge formula for a complete graph, $E = \frac{n(n-1)}{2}$, connecting just 10 computers requires 45 cables and nine plugs per machine!

![[k_10.png]]
*Each node represents a computer.*

### The Solution: The Network Switch
To solve this $O(n^2)$ scaling problem, we introduce a **network switch**. Its only job is to ensure that messages sent from a given computer arrive *only* at their targeted destination. 

Adding a switch transforms our topology into a **star graph** ($S_n$). Now, each computer only needs *one* plug to communicate with the switch, reducing the spatial complexity to $O(n)$.
 
![[star_graph.png]]
*To send a message from Node A to Node B, A sends it to the switch, which forwards it to B.*

## 2. Networks of Networks
A single switch cannot scale to connect billions of computers. However, since a switch is technically just a computer, we can connect multiple switches together to form a **network of networks** (often taking the shape of a **tree graph**).

![[tree_graph.png]]

**The Routing Problem:**
The more switches a packet has to traverse, the longer it takes. Furthermore, a strict tree topology risks disconnecting large portions of the network if a single central switch fails. 

To mitigate this, local networks are kept small and connected via a **Router**. A router is a specialized device that knows how to forward messages *between* different networks. 

> [!example] Packets as Wrapped Candy
> Whenever a picture or email travels across the internet, it is broken into smaller pieces called **packets**. Think of a packet like a piece of candy wrapped in several layers [00:03:57]. As it passes through the 10-15 routers between you and the destination, each router unwraps a layer to discover exactly where to send the packet next, ensuring it ends up on your screen and not someone else's.

**Connecting to the Outside World:**
- **Modem (Modulator-Demodulator):** Since early networks took advantage of existing telephone infrastructure, the modem was introduced to convert digital data into analog signals for transmission, and back into digital data upon receipt.
- **ISP (Internet Service Provider):** To reach external networks, we connect to an ISP. ISPs manage specialized, interconnected routers that can access other ISPs' routers, carrying your message to its final destination. The internet consists of this entire infrastructure of networks.

## 3. Finding Computers
Any device linked to a network has a unique identifier called an **IP (Internet Protocol) address**. 
- **IP Address:** A series of numbers (e.g., `192.0.2.172`) used to specify exactly which computer you want to reach.
- **DNS (Domain Name System):** Because humans are terrible at remembering random strings of numbers, the DNS acts as an address book, providing human-readable aliases (domain names like `google.com`) for these IP addresses.

## 4. Intranets and Extranets
While the internet is public, organizations often use the same underlying web technologies for private purposes:

> [!info] Intranets
> Private networks restricted to members of a particular organization. They act as secure portals for employees to access shared resources, manage key documents, and use collaboration tools (wikis, internal messaging).

> [!info] Extranets
> Very similar to Intranets, but they open up specific parts of the private network to trusted external parties (like clients, stakeholders, or partner organizations) to allow safe sharing and collaboration.

![[nets.png]]

---
**References:**
- [How the internet works](https://developer.mozilla.org/en-US/docs/Learn_web_development/Howto/Web_mechanics/How_does_the_Internet_work)
- YouTube: [How the Internet Works in 5 Minutes](https://www.youtube.com/watch?v=7_LPdttKXPc)
