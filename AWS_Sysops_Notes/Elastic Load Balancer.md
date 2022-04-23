# Introduction
Distributes network traffic across a group of servers.  
- It may do it in different ways: round-robin, intelligently, etc.  
- If one fails, it will not send anything there.  
- We can always increase capacity.

# Basics
- Application Load Balancer
	- HTTP and HTTPS
- Network Load Balancer
	- TCP and HIgh Performance
- Classic Load Balancer (Legacy)
	- HTTP/HTTPS and TCP
- Gateway Load Balancer
	- Allows you to balance workloads for third-party virtual appliances like: AWS Marketplace Virtual Appliances, Virtual Firewalls, IDS/IPS things, etc.

## 7-Layer Model
The 7-Layer Model is a framework for the network.
- Layer 7 (HTTP, Web Browser).  What the user sees.
- Layer 6 (Data is usable format, Encrypt, SSH).
- Layer 5 (Maintains connections and sessions).
- Layer 4 (Transmits data using TCP/UDP).
- Layer 3 (Logically routes packets based on IP).
- Layer 2 (Physically transmits data based on MAC addresses).
- Layer 1 (Transmits bits and bytes over physical devices.)

## Application Load Balancer
- Works on Layer 7 and is application-aware.
- Can use HTTP header to figure out where to send stuff.

## Network Load Balancer
- Works on Layer 4.  Transmits data using TCP and UDP.
- Capable of handling millions of requests per second easily.

## Classic Load Balancer
- Not the fastest, not the best.  Legacy.
- Works on layer-7.  

## X-Forwarded-For Header
This helps identify the originating IP address of a client connecting through a load balancers.  

USER -> Load Balancer -> END

The END will only see the Load Balancer IP.  If we use the `X-Forwarded-For` header, then the original IP address will appear in that header (if the browser supports it).

# Errors
## Server-side or Client-side?
- Server-side is a problem with the application.  
	- Usually a 5XX error code.  (5 is sort of like an "S" for "Server-side")
- Client-side is a problem with the request.
	- Usually a 4XX error code.

One of the most common errors is 504: Gateway Timeout.  The target failed to respond.  _Check your Application._  It couldn't establish a connection to the target.

502: Bad Gateway.  The target host is unreachable.  _You should see if traffic is allowed on the targets --- check security groups._

503: Service Unavailable: No Registered Targets.

400: Bad Request.  Malformed request.

408: Request Timeout.  The client did not send data before the idle timeout period expired.  (You might buy something but not pay in time).

464: Incoming request is incompatible with the target group protocol.

