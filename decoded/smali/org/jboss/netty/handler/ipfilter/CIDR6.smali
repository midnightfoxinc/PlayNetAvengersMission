.class public Lorg/jboss/netty/handler/ipfilter/CIDR6;
.super Lorg/jboss/netty/handler/ipfilter/CIDR;
.source "CIDR6.java"


# static fields
.field private static final logger:Lorg/jboss/netty/logging/InternalLogger;


# instance fields
.field private addressBigInt:Ljava/math/BigInteger;

.field private final addressEndBigInt:Ljava/math/BigInteger;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 31
    const-class v0, Lorg/jboss/netty/handler/ipfilter/CIDR6;

    invoke-static {v0}, Lorg/jboss/netty/logging/InternalLoggerFactory;->getInstance(Ljava/lang/Class;)Lorg/jboss/netty/logging/InternalLogger;

    move-result-object v0

    sput-object v0, Lorg/jboss/netty/handler/ipfilter/CIDR6;->logger:Lorg/jboss/netty/logging/InternalLogger;

    return-void
.end method

.method protected constructor <init>(Ljava/net/Inet6Address;I)V
    .locals 3
    .param p1, "newaddress"    # Ljava/net/Inet6Address;
    .param p2, "newmask"    # I

    .prologue
    .line 39
    invoke-direct {p0}, Lorg/jboss/netty/handler/ipfilter/CIDR;-><init>()V

    .line 40
    iput p2, p0, Lorg/jboss/netty/handler/ipfilter/CIDR6;->cidrMask:I

    .line 41
    invoke-static {p1}, Lorg/jboss/netty/handler/ipfilter/CIDR6;->ipv6AddressToBigInteger(Ljava/net/InetAddress;)Ljava/math/BigInteger;

    move-result-object v1

    iput-object v1, p0, Lorg/jboss/netty/handler/ipfilter/CIDR6;->addressBigInt:Ljava/math/BigInteger;

    .line 42
    invoke-static {p2}, Lorg/jboss/netty/handler/ipfilter/CIDR6;->ipv6CidrMaskToMask(I)Ljava/math/BigInteger;

    move-result-object v0

    .line 44
    .local v0, "mask":Ljava/math/BigInteger;
    :try_start_0
    iget-object v1, p0, Lorg/jboss/netty/handler/ipfilter/CIDR6;->addressBigInt:Ljava/math/BigInteger;

    invoke-virtual {v1, v0}, Ljava/math/BigInteger;->and(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v1

    iput-object v1, p0, Lorg/jboss/netty/handler/ipfilter/CIDR6;->addressBigInt:Ljava/math/BigInteger;

    .line 45
    iget-object v1, p0, Lorg/jboss/netty/handler/ipfilter/CIDR6;->addressBigInt:Ljava/math/BigInteger;

    invoke-static {v1}, Lorg/jboss/netty/handler/ipfilter/CIDR6;->bigIntToIPv6Address(Ljava/math/BigInteger;)Ljava/net/InetAddress;

    move-result-object v1

    iput-object v1, p0, Lorg/jboss/netty/handler/ipfilter/CIDR6;->baseAddress:Ljava/net/InetAddress;
    :try_end_0
    .catch Ljava/net/UnknownHostException; {:try_start_0 .. :try_end_0} :catch_0

    .line 49
    :goto_0
    iget-object v1, p0, Lorg/jboss/netty/handler/ipfilter/CIDR6;->addressBigInt:Ljava/math/BigInteger;

    iget v2, p0, Lorg/jboss/netty/handler/ipfilter/CIDR6;->cidrMask:I

    invoke-static {v2}, Lorg/jboss/netty/handler/ipfilter/CIDR6;->ipv6CidrMaskToBaseAddress(I)Ljava/math/BigInteger;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/math/BigInteger;->add(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v1

    sget-object v2, Ljava/math/BigInteger;->ONE:Ljava/math/BigInteger;

    invoke-virtual {v1, v2}, Ljava/math/BigInteger;->subtract(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v1

    iput-object v1, p0, Lorg/jboss/netty/handler/ipfilter/CIDR6;->addressEndBigInt:Ljava/math/BigInteger;

    .line 50
    return-void

    .line 46
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method private static bigIntToIPv6Address(Ljava/math/BigInteger;)Ljava/net/InetAddress;
    .locals 7
    .param p0, "addr"    # Ljava/math/BigInteger;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/UnknownHostException;
        }
    .end annotation

    .prologue
    const/16 v6, 0x11

    const/4 v5, 0x0

    const/16 v4, 0x10

    .line 148
    new-array v0, v4, [B

    .line 149
    .local v0, "a":[B
    invoke-virtual {p0}, Ljava/math/BigInteger;->toByteArray()[B

    move-result-object v1

    .line 150
    .local v1, "b":[B
    array-length v3, v1

    if-le v3, v4, :cond_1

    array-length v3, v1

    if-ne v3, v6, :cond_0

    aget-byte v3, v1, v5

    if-eqz v3, :cond_1

    .line 151
    :cond_0
    new-instance v3, Ljava/net/UnknownHostException;

    const-string v4, "invalid IPv6 address (too big)"

    invoke-direct {v3, v4}, Ljava/net/UnknownHostException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 153
    :cond_1
    array-length v3, v1

    if-ne v3, v4, :cond_2

    .line 154
    invoke-static {v1}, Ljava/net/InetAddress;->getByAddress([B)Ljava/net/InetAddress;

    move-result-object v3

    .line 164
    :goto_0
    return-object v3

    .line 157
    :cond_2
    array-length v3, v1

    if-ne v3, v6, :cond_3

    .line 158
    const/4 v3, 0x1

    invoke-static {v1, v3, v0, v5, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 164
    :goto_1
    invoke-static {v0}, Ljava/net/InetAddress;->getByAddress([B)Ljava/net/InetAddress;

    move-result-object v3

    goto :goto_0

    .line 161
    :cond_3
    array-length v3, v1

    rsub-int/lit8 v2, v3, 0x10

    .line 162
    .local v2, "p":I
    array-length v3, v1

    invoke-static {v1, v5, v0, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_1
.end method

.method private static ipv6AddressToBigInteger(Ljava/net/InetAddress;)Ljava/math/BigInteger;
    .locals 3
    .param p0, "addr"    # Ljava/net/InetAddress;

    .prologue
    .line 129
    instance-of v1, p0, Ljava/net/Inet4Address;

    if-eqz v1, :cond_0

    .line 130
    check-cast p0, Ljava/net/Inet4Address;

    .end local p0    # "addr":Ljava/net/InetAddress;
    invoke-static {p0}, Lorg/jboss/netty/handler/ipfilter/CIDR6;->getIpV6FromIpV4(Ljava/net/Inet4Address;)[B

    move-result-object v0

    .line 134
    .local v0, "ipv6":[B
    :goto_0
    const/4 v1, 0x0

    aget-byte v1, v0, v1

    const/4 v2, -0x1

    if-ne v1, v2, :cond_1

    .line 135
    new-instance v1, Ljava/math/BigInteger;

    const/4 v2, 0x1

    invoke-direct {v1, v2, v0}, Ljava/math/BigInteger;-><init>(I[B)V

    .line 137
    :goto_1
    return-object v1

    .line 132
    .end local v0    # "ipv6":[B
    .restart local p0    # "addr":Ljava/net/InetAddress;
    :cond_0
    invoke-virtual {p0}, Ljava/net/InetAddress;->getAddress()[B

    move-result-object v0

    .restart local v0    # "ipv6":[B
    goto :goto_0

    .line 137
    .end local p0    # "addr":Ljava/net/InetAddress;
    :cond_1
    new-instance v1, Ljava/math/BigInteger;

    invoke-direct {v1, v0}, Ljava/math/BigInteger;-><init>([B)V

    goto :goto_1
.end method

.method private static ipv6CidrMaskToBaseAddress(I)Ljava/math/BigInteger;
    .locals 2
    .param p0, "cidrMask"    # I

    .prologue
    .line 113
    sget-object v0, Ljava/math/BigInteger;->ONE:Ljava/math/BigInteger;

    rsub-int v1, p0, 0x80

    invoke-virtual {v0, v1}, Ljava/math/BigInteger;->shiftLeft(I)Ljava/math/BigInteger;

    move-result-object v0

    return-object v0
.end method

.method private static ipv6CidrMaskToMask(I)Ljava/math/BigInteger;
    .locals 2
    .param p0, "cidrMask"    # I

    .prologue
    .line 117
    sget-object v0, Ljava/math/BigInteger;->ONE:Ljava/math/BigInteger;

    rsub-int v1, p0, 0x80

    invoke-virtual {v0, v1}, Ljava/math/BigInteger;->shiftLeft(I)Ljava/math/BigInteger;

    move-result-object v0

    sget-object v1, Ljava/math/BigInteger;->ONE:Ljava/math/BigInteger;

    invoke-virtual {v0, v1}, Ljava/math/BigInteger;->subtract(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v0

    invoke-virtual {v0}, Ljava/math/BigInteger;->not()Ljava/math/BigInteger;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 1
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 29
    check-cast p1, Lorg/jboss/netty/handler/ipfilter/CIDR;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lorg/jboss/netty/handler/ipfilter/CIDR6;->compareTo(Lorg/jboss/netty/handler/ipfilter/CIDR;)I

    move-result v0

    return v0
.end method

.method public compareTo(Lorg/jboss/netty/handler/ipfilter/CIDR;)I
    .locals 8
    .param p1, "arg"    # Lorg/jboss/netty/handler/ipfilter/CIDR;

    .prologue
    const/4 v5, 0x1

    const/4 v3, 0x0

    const/4 v4, -0x1

    .line 65
    instance-of v6, p1, Lorg/jboss/netty/handler/ipfilter/CIDR4;

    if-eqz v6, :cond_3

    .line 66
    iget-object v6, p1, Lorg/jboss/netty/handler/ipfilter/CIDR;->baseAddress:Ljava/net/InetAddress;

    invoke-static {v6}, Lorg/jboss/netty/handler/ipfilter/CIDR6;->ipv6AddressToBigInteger(Ljava/net/InetAddress;)Ljava/math/BigInteger;

    move-result-object v0

    .line 67
    .local v0, "net":Ljava/math/BigInteger;
    iget-object v6, p0, Lorg/jboss/netty/handler/ipfilter/CIDR6;->addressBigInt:Ljava/math/BigInteger;

    invoke-virtual {v0, v6}, Ljava/math/BigInteger;->compareTo(Ljava/math/BigInteger;)I

    move-result v2

    .line 68
    .local v2, "res":I
    if-nez v2, :cond_0

    .line 69
    iget v6, p1, Lorg/jboss/netty/handler/ipfilter/CIDR;->cidrMask:I

    iget v7, p0, Lorg/jboss/netty/handler/ipfilter/CIDR6;->cidrMask:I

    if-ne v6, v7, :cond_1

    move v2, v3

    .line 91
    .end local v0    # "net":Ljava/math/BigInteger;
    .end local v2    # "res":I
    :cond_0
    :goto_0
    return v2

    .line 72
    .restart local v0    # "net":Ljava/math/BigInteger;
    .restart local v2    # "res":I
    :cond_1
    iget v3, p1, Lorg/jboss/netty/handler/ipfilter/CIDR;->cidrMask:I

    iget v6, p0, Lorg/jboss/netty/handler/ipfilter/CIDR6;->cidrMask:I

    if-ge v3, v6, :cond_2

    move v2, v4

    .line 73
    goto :goto_0

    :cond_2
    move v2, v5

    .line 75
    goto :goto_0

    .end local v0    # "net":Ljava/math/BigInteger;
    .end local v2    # "res":I
    :cond_3
    move-object v1, p1

    .line 79
    check-cast v1, Lorg/jboss/netty/handler/ipfilter/CIDR6;

    .line 80
    .local v1, "o":Lorg/jboss/netty/handler/ipfilter/CIDR6;
    iget-object v6, v1, Lorg/jboss/netty/handler/ipfilter/CIDR6;->addressBigInt:Ljava/math/BigInteger;

    iget-object v7, p0, Lorg/jboss/netty/handler/ipfilter/CIDR6;->addressBigInt:Ljava/math/BigInteger;

    invoke-virtual {v6, v7}, Ljava/math/BigInteger;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_4

    iget v6, v1, Lorg/jboss/netty/handler/ipfilter/CIDR6;->cidrMask:I

    iget v7, p0, Lorg/jboss/netty/handler/ipfilter/CIDR6;->cidrMask:I

    if-ne v6, v7, :cond_4

    move v2, v3

    .line 81
    goto :goto_0

    .line 83
    :cond_4
    iget-object v3, v1, Lorg/jboss/netty/handler/ipfilter/CIDR6;->addressBigInt:Ljava/math/BigInteger;

    iget-object v6, p0, Lorg/jboss/netty/handler/ipfilter/CIDR6;->addressBigInt:Ljava/math/BigInteger;

    invoke-virtual {v3, v6}, Ljava/math/BigInteger;->compareTo(Ljava/math/BigInteger;)I

    move-result v2

    .line 84
    .restart local v2    # "res":I
    if-nez v2, :cond_0

    .line 85
    iget v3, v1, Lorg/jboss/netty/handler/ipfilter/CIDR6;->cidrMask:I

    iget v6, p0, Lorg/jboss/netty/handler/ipfilter/CIDR6;->cidrMask:I

    if-ge v3, v6, :cond_5

    move v2, v4

    .line 87
    goto :goto_0

    :cond_5
    move v2, v5

    .line 89
    goto :goto_0
.end method

.method public contains(Ljava/net/InetAddress;)Z
    .locals 3
    .param p1, "inetAddress"    # Ljava/net/InetAddress;

    .prologue
    const/4 v1, 0x1

    .line 96
    if-nez p1, :cond_0

    .line 97
    new-instance v1, Ljava/lang/NullPointerException;

    const-string v2, "inetAddress"

    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 100
    :cond_0
    iget v2, p0, Lorg/jboss/netty/handler/ipfilter/CIDR6;->cidrMask:I

    if-nez v2, :cond_2

    .line 105
    :cond_1
    :goto_0
    return v1

    .line 104
    :cond_2
    invoke-static {p1}, Lorg/jboss/netty/handler/ipfilter/CIDR6;->ipv6AddressToBigInteger(Ljava/net/InetAddress;)Ljava/math/BigInteger;

    move-result-object v0

    .line 105
    .local v0, "search":Ljava/math/BigInteger;
    iget-object v2, p0, Lorg/jboss/netty/handler/ipfilter/CIDR6;->addressBigInt:Ljava/math/BigInteger;

    invoke-virtual {v0, v2}, Ljava/math/BigInteger;->compareTo(Ljava/math/BigInteger;)I

    move-result v2

    if-ltz v2, :cond_3

    iget-object v2, p0, Lorg/jboss/netty/handler/ipfilter/CIDR6;->addressEndBigInt:Ljava/math/BigInteger;

    invoke-virtual {v0, v2}, Ljava/math/BigInteger;->compareTo(Ljava/math/BigInteger;)I

    move-result v2

    if-lez v2, :cond_1

    :cond_3
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public getEndAddress()Ljava/net/InetAddress;
    .locals 3

    .prologue
    .line 55
    :try_start_0
    iget-object v1, p0, Lorg/jboss/netty/handler/ipfilter/CIDR6;->addressEndBigInt:Ljava/math/BigInteger;

    invoke-static {v1}, Lorg/jboss/netty/handler/ipfilter/CIDR6;->bigIntToIPv6Address(Ljava/math/BigInteger;)Ljava/net/InetAddress;
    :try_end_0
    .catch Ljava/net/UnknownHostException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 60
    :goto_0
    return-object v1

    .line 56
    :catch_0
    move-exception v0

    .line 57
    .local v0, "e":Ljava/net/UnknownHostException;
    sget-object v1, Lorg/jboss/netty/handler/ipfilter/CIDR6;->logger:Lorg/jboss/netty/logging/InternalLogger;

    invoke-interface {v1}, Lorg/jboss/netty/logging/InternalLogger;->isErrorEnabled()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 58
    sget-object v1, Lorg/jboss/netty/handler/ipfilter/CIDR6;->logger:Lorg/jboss/netty/logging/InternalLogger;

    const-string v2, "invalid ip address calculated as an end address"

    invoke-interface {v1, v2}, Lorg/jboss/netty/logging/InternalLogger;->error(Ljava/lang/String;)V

    .line 60
    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method
